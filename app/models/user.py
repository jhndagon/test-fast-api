from tortoise.models import Model
from tortoise.fields import UUIDField

class User(Model):
    id = UUIDField(pk=True)