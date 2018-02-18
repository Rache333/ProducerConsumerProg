cmake_minimum_required(VERSION 3.9)
project(ProdConsSync C)

set(CMAKE_C_STANDARD 99)

set(SOURCE_FILES main.c quest_arr_handler.c quest_arr_handler.h producer.c producer.h includes.h consumer.c consumer.h proc_handler.c proc_handler.h py_producer.c py_producer.h)

add_executable(ProdConsSync ${SOURCE_FILES})

target_link_libraries(ProdConsSync m rt pthread)
