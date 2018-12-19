classdef testClass < handle
    %UNTITLED25 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        p
    end
    
    methods
        function obj = testClass(val)
            obj.p = val;
        end
        
        function double(obj)
            obj.p = obj.p*2;
        end
    end
end

