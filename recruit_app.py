import pandas as pd
from DBManager import DBManager
from flask import Flask, request, Response, json, jsonify
from flask_cors import CORS


app = Flask(__name__)
# 모든 오리진에서의 CORS 요청을 허용 합니다.
CORS(app)

@app.route('/get_recommend', methods=['GET'])
def get_data():

    print(request.args)
    print(request)
    print(type(request.args))
    param = int(request.args.get('recruitmentNo', None).strip())
    print("전달받은 번호:", param)

    db = DBManager()
    sql="""
            select recruitment_no, industry_code, substr(company_location,1,3) as company_code
                 , education_code, experience_code, grade
            from recrut
    """
    df = pd.read_sql(sql=sql, con=db.conn)
    # 원-핫 인코딩 적용
    df_encoded = pd.get_dummies(df, columns=['COMPANY_CODE'])
    from sklearn.metrics.pairwise import cosine_similarity
    # 키 열을 제외하고 gk 계산
    similarity_matrix = cosine_similarity(df_encoded.drop('RECRUITMENT_NO', axis=1))
    # 유사도 행렬을 DataFrame으로 변환
    similarity_df = pd.DataFrame(similarity_matrix)
    print(similarity_df.head())
    # Key가 param인 아이템의 인덱스 찾기
    recommend = df.index[df['RECRUITMENT_NO'] == param].tolist()[0]

    # 697과의 유사도를 Series로 변환
    similarity_series = pd.Series(similarity_matrix[recommend])
    # 자기 자신(인덱스 697)을 제외하고 가장 유사도가 높은 상위 10개 인덱스 추출
    top_10_indices = similarity_series.nlargest(11).index.tolist()[1:]  # 자기 자신을 제외하기 위해 [1:] 사용
    # 상위 10개 인덱스에 해당하는 key 값 추출
    top_10_keys = df.loc[top_10_indices, 'RECRUITMENT_NO'].values
    print(top_10_keys)
    print(type(top_10_keys))
    print("="*100)

    top_10_keys_list = top_10_keys.tolist()  # numpy.ndarray를 파이썬 리스트로 변환
    response = Response(response=json.dumps(top_10_keys_list, ensure_ascii=False),
                        status=200,
                        mimetype='application/json; charset=utf-8')
    return response

if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0")