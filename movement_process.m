% -- Change to drilling down only
if (poss_down  == 1)
    can_down = 1;
    for i_t = 1:tool_w
    i_d = be_x + i_t - 1;
    tem = ct(tool(:, i_t)') + ct(drill(:, i_d)') - be_z;
        if (tem < comp_ve)
    	    can_down = 0;
	    break;
        end
    end

    if (can_down)                    %  && (mod(st, comp_x) == 0)
        fprintf('------ Tool can go down, move down...\n')
        be_z = be_z + comp_ve;
	poss_down = 0;
    end
end

