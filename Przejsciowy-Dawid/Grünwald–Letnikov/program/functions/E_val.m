function E_val = E_val(traj,P)



for i=1:1:length(traj)

E_val(i) = traj(:,i)'*P*traj(:,i); 

end
end

