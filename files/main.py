import uvicorn
from fastapi import FastAPI


app = FastAPI()

@app.get('/')
def hello_world():
    return {'response': 'Hello World!'}

uvicorn.run(app, host='0.0.0.0', port='8000')
