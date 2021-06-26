from app.db import generate_schemas, init_db
from fastapi import FastAPI


app = FastAPI()


@app.on_event("startup")
async def startup_event():
    # log.info("Starting up...")
    await init_db(app)
    await generate_schemas()
    # await generate_records_defaults()


@app.on_event("shutdown")
async def shutdown_event():
    # log.info("Shutting down...")
    pass
