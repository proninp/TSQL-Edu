UPDATE Ships
SET Name = REPLACE(REPLACE(REPLACE(Name,' ','<>'),'><',''),'<>',' ')