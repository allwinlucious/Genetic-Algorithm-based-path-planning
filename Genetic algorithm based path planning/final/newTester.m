function y = newTester(Base,Arm1,Arm2,extObject,Body,Cylinder,angles)
            
            nowAngle = IK3R_v5(Arm2.endPoint,96,174,166,12);
            angles = angles - nowAngle;
            
            Body = horzcat(Body.XData,Body.YData,Body.ZData);
            Cylinder = horzcat(Cylinder.XData,Cylinder.YData,Cylinder.ZData);
            %angular step
            step = 0.05;
            %TODO implement linestyle
            %TODO Tolerance Issues
            count = 1;
            
            if angles(1) >step
                
                baseVolumes(abs(round(angles(1)/step))).Vertices = 0;
                arm1Volumes(abs(round(angles(1)/step))).Vertices = 0;
                arm2Volumes(abs(round(angles(1)/step))).Vertices = 0;
                 %TODO use repmat
            end
            if angles(2)  >step
                arm1Volumes(abs(round(angles(2)/step))).Vertices = 0;

                arm2Volumes(abs(round(angles(2)/step))).Vertices = 0;
            end
            
            if angles(3)  >step
                arm2Volumes(abs(round(angles(3)/step))).Vertices = 0;

                arm2Volumes(abs(round(angles(3)/step))).Vertices = 0;%TODO use repmat
            end
         
            
            endCount =  max(abs(angles))/step;
            
            while true
                
                if step*count <= abs(angles(1))                
                    xBase = Base.vertices;
                    xArm1 = Arm1.vertices;
                    xArm2 = Arm2.vertices;
                    if angles(1)<0
                        Base.newRotator(-step);
                    else
                        Base.newRotator(step);
                    end
                    yBase = Base.vertices;
                    yArm1 = Arm1.vertices;
                    yArm2 = Arm2.vertices;
                    
                    temp = [xBase;yBase];
                    baseVolumes(count).Vertices = temp;
                    
                    
                    if step*count > abs(angles(2))
                        temp = [xArm1;yArm1];
                        arm1Volumes(count).Vertices = temp;
                    end
                    if step*count > abs(angles(3))
                        temp = [xArm2;yArm2];
                        arm2Volumes(count).Vertices = temp;
                    end

                end
                
                if step*count <= abs(angles(2))
                    xArm1 = Arm1.vertices;
                    xArm2 = Arm2.vertices;
                    
                    if angles(2)<0
                        Arm1.newRotator(-step);
                    else
                        Arm1.newRotator(step);
                    end
                        
                    yArm1 = Arm1.vertices;
                    yArm2 = Arm2.vertices;
                    
                    
                    temp = [xArm1;yArm1];
                    arm1Volumes(count).Vertices = temp;

                    if step*count > abs(angles(3))
                        temp = [xArm2;yArm2];
                        arm2Volumes(count).Vertices = temp;
                    end
                end
                
                if step*count <= abs(angles(3))
                    xArm2 = Arm2.vertices;
                    if angles(3)<0
                        Arm2.newRotator(-step);
                    else
                        Arm2.newRotator(step);
                    end
                    yArm2 = Arm2.vertices;
                    temp = [xArm2;yArm2];
                    arm2Volumes(count).Vertices = temp;
                    

                end
          
                if count >= endCount
                    break
                end
                
                count = count + 1;
          
            end
            

            if abs(angles(1)) >step || abs(angles(2))>step
                for i = 1:length(arm1Volumes)
                    
                    if arm1Volumes(i).Vertices == 0
                        break
                    end
                    
                    if round(openGJK(arm1Volumes(i).Vertices.',Body.')) == 0 ||  round(openGJK(arm1Volumes(i).Vertices.',Cylinder.')) == 0
%                     if GJK(arm1Volumes(i),extObject,5) == 1 || GJK(arm1Volumes(i),Body,5) ==1 ||  GJK(arm1Volumes(i),Cylinder,5) ==1
                        y = true;
                       
                        return
                        
                    end
                end
            end
            
            if abs(angles(1)) >step || abs(angles(2))> step || abs(angles(3)) > step
                
                for i = 1:length(arm2Volumes)
                    if arm2Volumes(i).Vertices == 0
                        break
                    end
                   
                    
                    if round(openGJK(arm2Volumes(i).Vertices.',Body.')) == 0 ||  round(openGJK(arm2Volumes(i).Vertices.',Cylinder.')) == 0
%                     if GJK(arm2Volumes(i),Body,5) == 1 ||  GJK(arm2Volumes(i),Cylinder,5) ==1
%                     if GJK(arm2Volumes(i),extObject,5) == 1 || GJK(arm2Volumes(i),Body,5) == 1 ||  GJK(arm2Volumes(i),Cylinder,5) ==1
                        y = true;
                        
                        return
                    end

                end
            end
            y = false;
            
            return
            
            
end

