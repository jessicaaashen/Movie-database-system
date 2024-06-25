# from rest_framework import routers
# from api import views
# router = routers.DefaultRouter()
# router.register(r'rate', views.RateViewSet)
from django.urls import path

from api import views

urlpatterns = [
    # path('snippets/', views.sn),
    path('rate/<int:user_id>', views.rate_detail),
    path('comment/<int:user_id>', views.comment_detail),
    path('collect/<int:user_id>', views.collect_detail),
]
