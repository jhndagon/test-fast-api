from pydantic import BaseSettings



class Setting(BaseSettings):
    POSTGRES_URL_DEV: str
    


settings = Setting()