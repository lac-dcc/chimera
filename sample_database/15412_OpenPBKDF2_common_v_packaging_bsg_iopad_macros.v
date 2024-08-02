// This program was cloned from: https://github.com/Asiadav/OpenPBKDF2
// License: MIT License

//*************************************************************************
//
// This file defines macros for PAD/IO-Cell instantions. Most processes
// will need to rewrite and redine these macros according to the available
// IO cells.
//
// Portable - These macro definitions are for block level designs
//            intended to be integrated into a larger design, or
//            for toplevel designs that don't want to bother
//            instantitaion real pads.
//


// Input IO macros
//
`define BSG_IO_IN(name,padtype)                       wire name``_i_int; assign name``_i_int = p_``name``_i;
`define BSG_IO_IN_V(name,index,padtype)               assign name``_i_int[index] = p_``name``_i[index];
`define BSG_IO_IN_A(pre,suffix,letter,index,padtype)  assign pre``_``suffix``_i_int[index] = p_``pre``_``suffix``_i[index];
`define BSG_IO_IN_ANA(name,padtype) \
    `BSG_IO_IN(name,"na")
`define BSG_IO_IN_DISABLE(name,padtype)               wire name``_i_int; assign name``_i_int = 0 & p_``name``_i;
`define BSG_IO_IN_DIFF_DISABLE(name,padtype) \
    `BSG_IO_IN_DISABLE(name``_p,padtype)     \
    `BSG_IO_IN_DISABLE(name``_n,padtype)


// Output IO macros
//
`define BSG_IO_OUT(name,padtype)                      wire name``_o_int; assign p_``name``_o = name``_o_int;
`define BSG_IO_OUT_V(name,index,padtype)              assign p_``name``_o[index] = name``_o_int[index];
`define BSG_IO_OUT_A(pre,suffix,letter,index,padtype) assign p_``pre``_``suffix``_o[index] = pre``_``suffix``_o_int[index];
`define BSG_IO_OUT_ANA(name,padtype) \
    `BSG_IO_OUT(name,"na")


// Tie hi/lo macros
//
`define BSG_IO_TIEHI(name)               assign name = 1'b1;
`define BSG_IO_TIELO(name)               assign name = 1'b0;
`define BSG_IO_TIEHI_VEC(name,width)     assign name = { width  {1'b1} };
`define BSG_IO_TIELO_VEC(name,width)     assign name = { width  {1'b0} };
`define BSG_IO_TIELO_VEC_ONE(name,index) assign name[index] = 1'b0;
`define BSG_IO_TIEHI_VEC_ONE(name,index) assign name[index] = 1'b1;


// Physical only macro (no logical connections)
//
`define BSG_PHYSICAL_ONLY_PAD(name,padtype) \
    /* intentionally left blank */


// 7-Bit Input Vector
//
`define BSG_IO_IN_V60(name,padtype) \
    wire [6:0] name``_i_int;        \
    `BSG_IO_IN_V(name,0,padtype);   \
    `BSG_IO_IN_V(name,1,padtype);   \
    `BSG_IO_IN_V(name,2,padtype);   \
    `BSG_IO_IN_V(name,3,padtype);   \
    `BSG_IO_IN_V(name,4,padtype);   \
    `BSG_IO_IN_V(name,5,padtype);   \
    `BSG_IO_IN_V(name,6,padtype);


// 8-Bit Input Vector
//
`define BSG_IO_IN_V70(name,padtype) \
    wire [7:0] name``_i_int;        \
    `BSG_IO_IN_V(name,0,padtype);   \
    `BSG_IO_IN_V(name,1,padtype);   \
    `BSG_IO_IN_V(name,2,padtype);   \
    `BSG_IO_IN_V(name,3,padtype);   \
    `BSG_IO_IN_V(name,4,padtype);   \
    `BSG_IO_IN_V(name,5,padtype);   \
    `BSG_IO_IN_V(name,6,padtype);   \
    `BSG_IO_IN_V(name,7,padtype);


// 4-Channel Input Array
//
`define BSG_IO_IN_ABCD(pre,suffix,padtypeA,padtypeB,padtypeC,padtypeD) \
    wire[3:0] pre``_``suffix``_i_int;                                  \
    `BSG_IO_IN_A(pre,suffix,A,0,padtypeA);                             \
    `BSG_IO_IN_A(pre,suffix,B,1,padtypeB);                             \
    `BSG_IO_IN_A(pre,suffix,C,2,padtypeC);                             \
    `BSG_IO_IN_A(pre,suffix,D,3,padtypeD);


// 7-Bit Output Vector
//
`define BSG_IO_OUT_V60(name,padtype) \
    wire [6:0] name``_o_int;         \
    wire [6:0] name``_oen_int;       \
    `BSG_IO_OUT_V(name,0,padtype);   \
    `BSG_IO_OUT_V(name,1,padtype);   \
    `BSG_IO_OUT_V(name,2,padtype);   \
    `BSG_IO_OUT_V(name,3,padtype);   \
    `BSG_IO_OUT_V(name,4,padtype);   \
    `BSG_IO_OUT_V(name,5,padtype);   \
    `BSG_IO_OUT_V(name,6,padtype);   \


// 8-Bit Output Vector
//
`define BSG_IO_OUT_V70(name,padtype) \
    wire [7:0] name``_o_int;         \
    wire [7:0] name``_oen_int;       \
    `BSG_IO_OUT_V(name,0,padtype);   \
    `BSG_IO_OUT_V(name,1,padtype);   \
    `BSG_IO_OUT_V(name,2,padtype);   \
    `BSG_IO_OUT_V(name,3,padtype);   \
    `BSG_IO_OUT_V(name,4,padtype);   \
    `BSG_IO_OUT_V(name,5,padtype);   \
    `BSG_IO_OUT_V(name,6,padtype);   \
    `BSG_IO_OUT_V(name,7,padtype);


// 4-Channel Output Array
//
`define BSG_IO_OUT_ABCD(pre,suffix,padtypeA,padtypeB,padtypeC,padtypeD) \
    wire [3:0] pre``_``suffix``_o_int;                                  \
    wire [3:0] pre``_``suffix``_oen_int;                                \
    `BSG_IO_OUT_A(pre,suffix,A,0,padtypeA);                             \
    `BSG_IO_OUT_A(pre,suffix,B,1,padtypeB);                             \
    `BSG_IO_OUT_A(pre,suffix,C,2,padtypeC);                             \
    `BSG_IO_OUT_A(pre,suffix,D,3,padtypeD);


//
//
// **********************************************************************
