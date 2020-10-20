module Api
  module V1
    class BlogsController < ApplicationController
      def index
        blogs = Blog.order('created_at DESC');
        render json: {status: 'SUCCESS', message: 'Loaded blogs', data: blogs}, status: :ok
      end

      def show
        blog = Blog.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded blog', data: blog}, status: :ok
      end

      def create
        blog = Blog.new(blog_params)
        if blog.save
          render json: {status: 'SUCCESS', message: 'Saved blog', data: blog}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Blog not saved', data: blog.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        blog = Blog.find(params[:id])
        blog.destroy
        render json: {status: 'SUCCESS', message: 'Deleted blog', data: blog}, status: :ok
      end

      def update
        blog = Blog.find(params[:id])
        if blog.update_attributes(blog_params)
          render json: {status: 'SUCCESS', message: 'Updated blog', data: blog}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Blog not updated', data: blog.errors}, status: :unprocessable_entity
        end
      end

      private
      def blog_params
        params.permit(:title, :body)
      end
    end
  end
end