function createSwept(Base,Arm1,Arm2,angles,color)
            angles = angles - [Base.angle,Arm1.angle,Arm2.angle]
            %angular step
            step = 0.05;
            %TODO implement linestyle
            %TODO Tolerance Issues
            count = 1;
            
            if angles(1) >step
                
                baseVolumes(abs(round(angles(1)/step))).Vertices = 0;
                baseVolumes(abs(round(angles(1)/step))).Faces = 0; %TODO use repmat
            end
            if angles(2)  >step
                arm1Volumes(abs(round(angles(2)/step))).Vertices = 0;
                arm1Volumes(abs(round(angles(2)/step))).Faces = 0; %TODO use repmat
            end
            
            if angles(3)  >step
                arm2Volumes(abs(round(angles(3)/step))).Vertices = 0;
                arm2Volumes(abs(round(angles(3)/step))).Faces = 0; %TODO use repmat
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
                    
                    baseVolumes(count).Vertices = [xBase;yBase];
                    baseVolumes(count).Faces = convhull([xBase;yBase]);
                    baseVolumes(count).FaceColor = color;
                    baseVolumes(count).LineStyle = 'None';
                    
                    arm1Volumes(count).Vertices = [xArm1;yArm1];
                    arm1Volumes(count).Faces = convhull([xArm1;yArm1]);
                    arm1Volumes(count).FaceColor = color;
                    arm1Volumes(count).LineStyle = 'None';
                    
                    arm2Volumes(count).Vertices = [xArm2;yArm2];
                    arm2Volumes(count).Faces = convhull([xArm2;yArm2]);
                    arm2Volumes(count).FaceColor = color;
                    arm2Volumes(count).LineStyle = 'None';
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
                    
                    arm1Volumes(count).Vertices = [xArm1;yArm1];
                    arm1Volumes(count).Faces = convhull([xArm1;yArm1]);
                    arm1Volumes(count).FaceColor = color;
                    arm1Volumes(count).LineStyle = 'None';
                    
                    arm2Volumes(count).Vertices = [xArm2;yArm2];
                    arm2Volumes(count).Faces = convhull([xArm2;yArm2]);
                    arm2Volumes(count).FaceColor = color;
                    arm2Volumes(count).LineStyle = 'None';
                end
                
                if step*count <= abs(angles(3))
                    xArm2 = Arm2.vertices;
                    if angles(3)<0
                        Arm2.newRotator(-step);
                    else
                        Arm2.newRotator(step);
                    end
                    yArm2 = Arm2.vertices;
                    arm2Volumes(count).Vertices = [xArm2;yArm2];
                    arm2Volumes(count).Faces = convhull([xArm2;yArm2]);
                    arm2Volumes(count).FaceColor = color;
                    arm2Volumes(count).LineStyle = 'None';
                end
          
                if count >= endCount
                    break
                end
                
                count = count + 1;
          
            end
            
            if angles(1)>step
                graphics(baseVolumes)
            end
            
            if exist('arm1Volumes','var')
                graphics(arm1Volumes)
            end
            if exist('arm2Volumes','var')
                graphics(arm2Volumes)
            end
end
    
function graphics(baseVolumes)
    for i = 1:length(baseVolumes)
                
                if baseVolumes(i).Vertices == 0
                    break
                end
                baseVolumes(i).FaceAlpha = 0.1;
                patch(baseVolumes(i));
                
                
    end
    
end
