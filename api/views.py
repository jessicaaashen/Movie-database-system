# Create your views here.
import random

from django.core.cache import cache
from django.db.models import Count
from rest_framework.decorators import api_view
from rest_framework.response import Response

from api.serializers import *
from cache_keys import USER_CACHE
from user.models import Rate, Movie, Comment, User

@api_view(['GET'])
def rate_detail(request, user_id):
    rate = Rate.objects.filter(user_id=user_id)
    # a=Rate.objects.first()
    serializer = RateSerializer(rate, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def collect_detail(request, user_id):
    user = User.objects.get(id=user_id)
    collect_movies = user.movie_set.all()
    serializer = CollectSerializer(collect_movies, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def comment_detail(request, user_id):
    comment = Comment.objects.filter(user_id=user_id)
    serializer = CommentSerializer(comment, many=True)
    return Response(serializer.data)

