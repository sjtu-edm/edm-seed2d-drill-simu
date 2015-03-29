% 1 - Removed
% 2 - Drill part
% 0 - Tool part

comb = uint8(ones(drill_h + 10*ele_w, drill_l));
comb((1 + 10*ele_w):(drill_h + 10*ele_w), :) = drill;
flptl = flipud(tool(1:(be_z+10*ele_w), 1:tool_w));
flptl1 = [fliplr(flptl) flptl];
comb(1:(be_z+10*ele_w), (be_x - tool_w):(be_x+tool_w-1)) = flptl1 & comb(1:(be_z+10*ele_w), (be_x-tool_w):(be_x+tool_w-1));
% comb((be_z+1):(be_z+tool_h/2), (be_x - tool_w):(be_x+tool_w-1)) = flptl1 & comb((be_z+1):(be_z+tool_h/2), (be_x-tool_w):(be_x+tool_w-1));
center_x = be_x;
% center_z = ct(comb(:, be_x)');`
center_z = be_z - ct(tool(:, 1)') +  10*ele_w;
range_x1 = max(1, center_x - round(tool_w*1.1));
range_x2 = min(drill_l, center_x + round(tool_w*1.1));
range_z1 = 1;
range_z2 = min(drill_h + 10*ele_w, center_z + 10*ele_w);
for i = range_z1:range_z2
    if ((i - 10*ele_w) > 0)
        for j = range_x1:range_x2
            if (drill(i - (10*ele_w), j) == 0)
                comb(i, j) = 2;
            end
        end
    end
end
