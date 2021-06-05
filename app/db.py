from tortoise import Tortoise, run_async

from app.config import settings


async def init_db(app):
    modules = {
        'models': ['app.models']
    }
    await Tortoise.init(
        db_url=settings.POSTGRES_URL_DEV,
        modules=modules
    )
    

async def generate_schemas():    
    await Tortoise.generate_schemas()