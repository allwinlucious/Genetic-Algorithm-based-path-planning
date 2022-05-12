classdef Arms < handle
    properties
        name
        child
        parent
        vertices
        initialAxis
        
        
    end
    properties(Dependent)
        origin
        endPoint
        angle
    end
    methods
        
        function ori = get.origin(obj)
            
            if obj.parent == 0
                ori = [0 0 0];
            elseif obj.parent.parent == 0
                ori = sum(obj.vertices(1:4,:))/4;
            else
                ori = obj.parent.endPoint;
            
            end
        end
        
        function endP = get.endPoint(obj)
%             endP = (obj.vertices(6,:) + obj.vertices(8,:))/2;
            if obj.parent == 0
                endP = obj.child.origin;
                return
            end
            endP = sum(obj.vertices(5:8,:))/4;
            
        end
        
        function ang = get.angle(obj)
            if obj.parent == 0
                now = (obj.vertices(2,:) + obj.vertices(4,:))/2;
                now = now/norm(now);
                axis = obj.initialAxis/norm(obj.initialAxis);
                ref = cross(axis,now);
                ref = ref/norm(ref);
                if ref == [0 0 1]
                    ang = real(acos(sum(now .*axis)));
                else
                    ang = -real(acos(sum(now .*axis)));
                    return
                end
            
            elseif obj.parent.parent == 0
                ref = (obj.parent.vertices(1,:) + obj.parent.vertices(2,:))/2;
                ref = round(ref/norm(ref));
                now = obj.endPoint - obj.origin;
                now = now/norm(now);
                prev = (obj.parent.vertices(2,:) + obj.parent.vertices(4,:))/2;
                prev = prev/norm(prev);
                
                cproduct = cross(now,prev);
                cproduct = round(cproduct/norm(cproduct));
                
                if cproduct == ref
                    ang = real(acos(sum(now.*prev)));
                else
                    ang = -real(acos(sum(now.*prev)));
                end
                return
                
            else 
                ref = (obj.parent.parent.vertices(1,:) + obj.parent.parent.vertices(2,:))/2;
                ref = round(ref/norm(ref));
                now = obj.endPoint - obj.origin;
                now = now/norm(now);
                prev =  obj.origin - obj.parent.origin ;
                prev = prev/norm(prev);
                
                cproduct = cross(now,prev);
                cproduct = round(cproduct/norm(cproduct));
                
                if cproduct == ref
                    ang = real(acos(sum(now.*prev)));
                else
                    
                    ang = -real(acos(sum(now.*prev)));
                end
                return
               
              
            end
               
        end
        
        function x = createShape(obj,color)
            x = struct('Vertices',obj.vertices,'Faces',convhull(obj.vertices),'FaceColor',color,'FaceAlpha',0.9);
        end
        
        function newRotator(obj,angle,axis,transMat,primaryOrigin)
            
            
            %finding the axis
            
%             if ~exist('axis','var')
            if nargin == 2
                
                if obj.name == 'Base'
                    axis = [0 0 -1];
         
                else
                    if obj.parent.name == 'Base'
                        
                        side = (obj.parent.vertices(2,:) + obj.parent.vertices(4,:))/2;
                        axis = cross(obj.origin,side);
                        axis = axis/norm(axis);
                    else
                        a = obj.parent;
                        side = (a.parent.vertices(2,:) + a.parent.vertices(4,:))/2;
                        axis = cross(a.origin,side);
                        axis = axis/norm(axis);
                    end    
        
                end
                
                primaryOrigin = obj.origin;
                
                l = axis(1);
                m = axis(2);
                n = axis(3);
                y = angle;
                transMat = [l*l*(1-cos(y))+cos(y) m*l*(1-cos(y))-n*sin(y) n*l*(1-cos(y))+m*sin(y);
                            l*m*(1-cos(y))+n*sin(y) m*m*(1-cos(y))+cos(y) n*m*(1-cos(y))-l*sin(y);
                            l*n*(1-cos(y))-m*sin(y) m*n*(1-cos(y))+l*sin(y) n*n*(1-cos(y))+cos(y)];
            end
            
            
            offsetVertices = bsxfun(@minus,obj.vertices,primaryOrigin);

            x = zeros(size(obj.vertices));
            for i = 1:length(obj.vertices)
                x(i,:) = offsetVertices(i,:)*transMat;
            end
            obj.vertices = bsxfun(@plus,x, primaryOrigin);
            
            if obj.child ~= 0
                obj.child.newRotator(angle,axis,transMat,primaryOrigin);
                
            else
                return
            end
            
        end
        
        
   
    end
end