// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

module MUX_2_1 (
    input x1, input x2, input s,
    output f
);

    not (sn, s);
    
    and A0 (g0, sn, x1);
    and A1 (g1, s, x2);

    or O0(f,g0, g1); 


endmodule //MUX_2_1