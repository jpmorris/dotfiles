    fitControl <-
        trainControl(
          method = if(exists(traincontrol.method)) preprocess.transforms else formals(trainControl)$method,
          number = if(exists(traincontrol.number)) preprocess.transforms else formals(trainControl)$number,
          repeats = if(exists(traincontrol.repeats)) preprocess.transforms else formals(trainControl)$repeats,
          p = if(exists(traincontrol.p)) preprocess.transforms else formals(trainControl)$p,
          search = if(exists(traincontrol.search)) preprocess.transforms else formals(trainControl)$search,
          returnData = if(exists(traincontrol.returnData)) preprocess.transforms else formals(trainControl)$returnData,extra long line for test
          method = if(exists(traincontrol.method)) preprocess.transforms else formals(trainControl)$method,
          method = if(exists(traincontrol.method)) preprocess.transforms else formals(trainControl)$method,
          method = if(exists(traincontrol.method)) preprocess.transforms else formals(trainControl)$method,
1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123
