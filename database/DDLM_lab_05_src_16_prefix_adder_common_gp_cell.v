// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module gp_cell
(
    input  wire g_left, g_right, p_left, p_right,
    output wire g_out, p_out
);

    assign g_out = g_left | p_left & g_right;
    assign p_out = p_left & p_right;
    
endmodule




