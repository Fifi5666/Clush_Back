package com.clush.todo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Todo {
    int no;
    String name;
    int status;
    Date dueDate;
    Date regDate;
    Date updDate;
    String priority;
}
