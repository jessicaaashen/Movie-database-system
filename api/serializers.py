from rest_framework import serializers

from user.models import *

from datetime import timedelta

class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tags
        fields = ['name']

class DirectorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Director
        fields = ['name']

class ActorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Actor
        fields = ['name']



class RateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Rate

    def to_representation(self, instance):  # 显示时间为东八区区时
        adjusted_time = instance.create_time + timedelta(hours=8)
        formatted_time = adjusted_time.strftime('%Y-%m-%d %H:%M:%S')
        return {'电影名': instance.movie.name, '评分': instance.mark, '创建时间': formatted_time}


class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment

    def to_representation(self, instance):  # 显示时间为东八区区时
        adjusted_time = instance.create_time + timedelta(hours=8)
        formatted_time = adjusted_time.strftime('%Y-%m-%d %H:%M:%S')
        return {'电影名': instance.movie.name, '评论内容': instance.content, '创建时间': formatted_time}


class CollectSerializer(serializers.ModelSerializer):
    tags = TagSerializer(many=True)
    director = DirectorSerializer(many=True)
    actor = ActorSerializer(many=True)

    class Meta:
        model = Movie
        fields = ['name', 'years', 'num', 'director']

    def to_representation(self, instance):
        return {'电影名': instance.name, '导演': [director.name for director in instance.director.all()], '上映时间': instance.years, '浏览量': instance.num}


class MovieSerializer(serializers.ModelSerializer):
    class Meta:
        model = Movie
        fields = ['name', 'image_link', 'id', 'years', 'd_rate', 'director']
