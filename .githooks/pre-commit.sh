#!/bin/bash
# Source: https://github.com/apple/pkl-intellij/blob/f2a96d3b90a9f3c0f5e35374fae7b436e72ef235/src/main/kotlin/org/pkl/intellij/packages/PklProjectService.kt#L82-L90
/usr/bin/pkl eval -x "
  new JsonRenderer { omitNullProperties = false }
    .renderValue(new Dynamic {
      projectFileUri = module.projectFileUri
      declaredDependencies = module.dependencies.toMap().mapValues((_, value) ->
        if (value is RemoteDependency) value.uri
        else value.package.uri
      )
      evaluatorSettings = module.evaluatorSettings
    })
" --module-output-separator ", " ../PklProject