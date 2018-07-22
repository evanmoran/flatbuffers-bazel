def _cc_flatbuffers_compile(ctx):
    args = ["--cpp"] + ["-o", ctx.outputs.out.dirname] + [f.path for f in ctx.files.srcs]

    ctx.action(
        inputs=ctx.files.srcs,
        outputs=[ctx.outputs.out],
        arguments=args,
        executable=ctx.executable._flatc
    )

cc_flatbuffers_compile = rule(
    implementation = _cc_flatbuffers_compile,
    output_to_genfiles = True,
    attrs = {
        "srcs": attr.label(allow_files = True),
        "out": attr.output(mandatory = True),
        "_flatc": attr.label(executable = True,
            cfg = "host",
            allow_files = True,
            default = Label("@flatbuffers//:flatc")),
     }
)
