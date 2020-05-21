from django.apps import AppConfig
from suit.apps import DjangoSuitConfig

class UsersConfig(AppConfig):
    name = 'users'

class SuitConfig(DjangoSuitConfig):
    layout = 'horizontal'