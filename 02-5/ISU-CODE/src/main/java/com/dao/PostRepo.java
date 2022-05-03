package com.dao;

import org.springframework.data.repository.CrudRepository;

import com.bean.Post;

public interface PostRepo extends CrudRepository<Post, Integer> {

}
