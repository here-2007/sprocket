#@ except: BashSetSyntax, EmptyOutputs, MatchingOutputMeta, OutputMetaOrder, MetaDescription, MetaSections
#@ except: RequirementsSection, ShellCheck

version 1.3

workflow parameter_meta_order_workflow {
    parameter_meta {
        second: "The second input"
        first: "The first input"
    }

    input {
        String first
        String second
    }
}

struct ParameterMetaOrderStruct {
    parameter_meta {
        second: "The second field"
        first: "The first field"
    }

    String first
    String second
}

task parameter_meta_order_task {
    parameter_meta {
        second: "The second input"
        first: "The first input"
    }

    input {
        String first
        String second
    }

    requirements {
        container: "ubuntu@sha256:cc925e589b7543b910fea57a240468940003fbfc0515245a495dd0ad8fe7cef1"
    }

    command <<<
        echo "~{first} ~{second}"
    >>>
}

task more_parameters {
    parameter_meta {
        first: "The first input"
        third: "The third input"
        second: "The second input"
    }

    input {
        String first
        String second
        String third
    }

    requirements {
        container: "ubuntu@sha256:cc925e589b7543b910fea57a240468940003fbfc0515245a495dd0ad8fe7cef1"
    }

    command <<<
        echo "~{first} ~{second} ~{third}"
    >>>
}
