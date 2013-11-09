###
## Extend the Number prototype
## This needs to stay globally defined
## @param func
## @param scope [optional]
###

Number::times = (func, scope) ->
  v = @valueOf()
  i = 0

  while i < v
    func.call scope or window, i
    i++

isUnevaluated = (functionToCheck) ->
  getType = {}
  functionToCheck and getType.toString.call(functionToCheck) is "[object Function]"

storeIfUnevaluated = (functionToCheck) ->
  getType = {}
  if functionToCheck and getType.toString.call(functionToCheck) is "[object Function]"
  	return functionToCheck
  else
  	return null

evaluateIfUnevaluated = (functionToCheck) ->
  getType = {}
  if functionToCheck and getType.toString.call(functionToCheck) is "[object Function]"
  	return functionToCheck()
  else
  	return functionToCheck