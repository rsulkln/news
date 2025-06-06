from django.contrib import admin
from .models import Article, Comment


class ListArticle(admin.ModelAdmin):
    list_display = (
        "title",
        "body",
        "author",
    )


class CommentInLine(admin.StackedInline):
    model = Comment
    extra = 0


class ArticleAdmin(admin.ModelAdmin):
    inlines = [
        CommentInLine,
    ]
    list_display = [
        "title",
        "body",
        "author",
    ]


admin.site.register(Article, ArticleAdmin)
admin.site.register(Comment)
