load("//:flatbuffers.bzl", "cc_flatbuffers_compile")

cc_flatbuffers_compile(
    name = "monster_fbs",
    srcs = "monster.fbs",
    out = "monster_generated.h",
)

cc_library(
    name = "monster_library",
    hdrs = ["monster_generated.h"],
    includes = ["monster_generated.h"],
)

cc_binary(
    name = "sample_binary",
    srcs = ["sample_binary.cpp"],
    deps = ["@flatbuffers//:flatc_library", ":monster_library"],
)