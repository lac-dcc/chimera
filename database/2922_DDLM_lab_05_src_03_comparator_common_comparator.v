// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module comparator
#( 
    parameter WIDTH = 8
)
(
    input  [WIDTH - 1:0] x, y,    
    output eq, neq, lt, lte, gt, gte
);
    assign eq  = (x == y);
    assign neq = (x != y);
    assign lt  = (x <  y);
    assign lte = (x <= y);
    assign gt  = (x >  y);
    assign gte = (x >= y);
endmodule