from fastapi import FastAPI, File

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.post("/api/process-image/")
def process_image(file: bytes = File(...)):
    return {"file_size": len(file)}
