module top
(
    input  clk,
    output led,

    inout            io_1  , io_2  , io_3  , io_4  , io_5  , io_6  , io_7  , io_8  ,
                                                     io_15 , io_16 , io_17 , io_18 , io_19 ,
           io_20  ,  io_21 ,                                 io_26 , io_27 , io_28 , io_29 ,
           io_30  ,                  io_33 , io_34 , io_35 , io_36 , io_37 , io_38 , io_39 ,
           io_40  ,  io_41 , io_42 , io_43 , io_44 ,                 io_47 , io_48 , io_49 ,
           io_50  ,  io_51 , io_52 , io_53 , io_54 , io_55 , io_56 , io_57 , io_58 ,
                     io_61 ,                                 io_66 , io_67 , io_68 , io_69 ,
           io_70  ,  io_71 , io_72 , io_73 , io_74 , io_75 , io_76 ,         io_78 ,
                     io_81 , io_82 , io_83 , io_84 , io_85 , io_86 , io_87 , io_88 , io_89 ,
           io_90  ,  io_91 , io_92 ,                 io_95 , io_96 , io_97 , io_98 , io_99 ,
           io_100
);

    reg [31:0] cnt;
    
    always @ (posedge clk)
        cnt <= cnt + 1;

    assign led = cnt [24];

    wire [ 3:0] key = { io_15 , io_16 , io_17 , io_18 };
    wire [ 7:0] sw  = { io_1  , io_2  , io_3  , io_4  , io_5  , io_6  , io_7  , io_8 };

    wire [11:0] led2;
    wire [ 7:0] abcdefgh;
    wire [ 7:0] digit;
    wire        buzzer;

    assign { io_81 , io_82 , io_83 , io_84 , io_85 , io_86 ,
             io_87 , io_88 , io_89 , io_90 , io_91 , io_92 } = led2;

    assign { io_33 , io_34 , io_35 , io_36 ,
             io_37 , io_38 , io_39 , io_40 } = abcdefgh;

    assign { io_50 , io_51 , io_52 , io_53 ,
             io_54 , io_55 , io_56 , io_57 } = digit;

    assign io_58 = buzzer;

    top2 i_top2
    (
        clk,
        key,
        sw,
        led2,
        abcdefgh,
        digit,
        buzzer
    );

endmodule
