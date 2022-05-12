function y = collisionTester(Base,Arm1,Arm2,extObject,Body,Cylinder,angles)
            
            
            angles = angles - IK3R_v5(Arm2.endPoint,96,174,166,12);
            
            %angular step
            step = 0.1;
            %TODO implement linestyle
            %TODO Tolerance Issues
            count = 1;
            
            if angles(1) >step
                
                baseVolumes(abs(round(angles(1)/step))).XData = 0;
                baseVolumes(abs(round(angles(1)/step))).YData = 0;
                baseVolumes(abs(round(angles(1)/step))).ZData = 0;
                 %TODO use repmat
            end
            if angles(2)  >step
                arm1Volumes(abs(round(angles(2)/step))).XData = 0;
                arm1Volumes(abs(round(angles(2)/step))).YData = 0;
                arm1Volumes(abs(round(angles(2)/step))).ZData = 0;%TODO use repmat
            end
            
            if angles(3)  >step
                arm2Volumes(abs(round(angles(3)/step))).XData = 0;
                arm2Volumes(abs(round(angles(3)/step))).YData = 0;
                arm2Volumes(abs(round(angles(3)/step))).ZData = 0;%TODO use repmat
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
                    baseVolumes(count).XData = temp(:,1);
                    baseVolumes(count).YData = temp(:,2);
                    baseVolumes(count).ZData = temp(:,3);
                    
                    if step*count > abs(angles(2))
                        temp = [xArm1;yArm1];
                        arm1Volumes(count).XData = temp(:,1);
                        arm1Volumes(count).YData = temp(:,2);
                        arm1Volumes(count).ZData = temp(:,3);
                    end
                    if step*count > abs(angles(3))
                        temp = [xArm2;yArm2];
                        arm2Volumes(count).XData = temp(:,1);
                        arm2Volumes(count).YData = temp(:,2);
                        arm2Volumes(count).ZData = temp(:,3);
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
                    arm1Volumes(count).XData = temp(:,1);
                    arm1Volumes(count).YData = temp(:,2);
                    arm1Volumes(count).ZData = temp(:,3);

                    if step*count > abs(angles(3))
                        temp = [xArm2;yArm2];
                        arm2Volumes(count).XData = temp(:,1);
                        arm2Volumes(count).YData = temp(:,2);
                        arm2Volumes(count).ZData = temp(:,3);
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
                    arm2Volumes(count).XData = temp(:,1);
                    arm2Volumes(count).YData = temp(:,2);
                    arm2Volumes(count).ZData = temp(:,3);
                    

                end
          
                if count >= endCount
                    break
                end
                
                count = count + 1;
          
            end
            
            if abs(angles(1))>step

                for i = 1:length(baseVolumes)
                    if baseVolumes(i).XData == 0
                        break
                    end
                    

                    if GJK(baseVolumes(i),extObject,5) == 1
                        'base'
                        y = true;
                        
                        return

                    end
                end
            end
            if abs(angles(1)) >step || abs(angles(2))>step
                for i = 1:length(arm1Volumes)
                    
                    if arm1Volumes(i).XData == 0
                        break
                    end
                    
                    
                    if GJK(arm1Volumes(i),extObject,5) == 1 || GJK(arm1Volumes(i),Body,5) ==1 ||  GJK(arm1Volumes(i),Cylinder,5) ==1
                        y = true;
                        'arm1'
                        return
                        
                    end
                end
            end
            
            if abs(angles(1)) >step || abs(angles(2))> step || abs(angles(3)) > step
                
                for i = 1:length(arm2Volumes)
                    if arm2Volumes(i).XData == 0
                        break
                    end
                    
                    
                    
                    if GJK(arm2Volumes(i),extObject,5) == 1 || GJK(arm2Volumes(i),Body,5) == 1 ||  GJK(arm2Volumes(i),Cylinder,5) ==1
                        y = true;
                        
                        return
                    end

                end
            end
            y = false;
            
            return
            
            
end

