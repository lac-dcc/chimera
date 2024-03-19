//a Note: created by CDL 1.3.6 - do not hand edit without recognizing it will be out of sync with the source
// Output mode 0 (VMOD=1, standard verilog=0)

//a Module lsa_core
module lsa_core
(
    clock_in,

    mem_in,
    reset_in,

    mem_fetch,
    mem_we,
    mem_oe,
    mem_add,
    mem_out
);

    //b Clocks
    input clock_in;

    //b Inputs
    input [15:0]mem_in;
    input reset_in;

    //b Outputs
    output mem_fetch;
    output mem_we;
    output mem_oe;
    output [15:0]mem_add;
    output [15:0]mem_out;

// output components here

    //b Output combinatorials
    reg mem_fetch;
    reg mem_we;
    reg mem_oe;
    reg [15:0]mem_add;
    reg [15:0]mem_out;

    //b Output nets

    //b Internal and output registers
    reg [15:0]reg__value[15:0];
    reg [1:0]xstate;
    reg [15:0]inst;

    //b Internal combinatorials
    reg [16:0]op_res;
    reg [16:0]op_b;
    reg [16:0]op_a;
    reg [1:0]xstate_next;
    reg [15:0]pc_temp;
    reg [15:0]pc_next;

    //b Internal nets

    //b Clock gating module instances
    //b Module instances
    //b the_code__comb combinatorial process
    always @( //the_code__comb
        xstate or
        inst or
        //reg__value - Xilinx does not want arrays in sensitivity lists
        reg__value[0] or
        reg__value[1] or
        reg__value[2] or
        reg__value[3] or
        reg__value[4] or
        reg__value[5] or
        reg__value[6] or
        reg__value[7] or
        reg__value[8] or
        reg__value[9] or
        reg__value[10] or
        reg__value[11] or
        reg__value[12] or
        reg__value[13] or
        reg__value[14] or
        reg__value[15] )
    begin: the_code__comb_code
    reg [15:0]pc_next__var;
    reg [15:0]pc_temp__var;
    reg mem_oe__var;
    reg mem_we__var;
    reg [15:0]mem_add__var;
    reg [15:0]mem_out__var;
    reg mem_fetch__var;
    reg [16:0]op_a__var;
    reg [16:0]op_b__var;
    reg [16:0]op_res__var;
    reg [1:0]xstate_next__var;
        pc_next__var = 16'h0;
        pc_temp__var = 16'h0;
        mem_oe__var = 1'h0;
        mem_we__var = 1'h0;
        mem_add__var = 16'h0;
        mem_out__var = 16'h0;
        mem_fetch__var = 1'h0;
        op_a__var = 17'h0;
        op_b__var = 17'h0;
        op_res__var = 17'h0;
        case (xstate) //synopsys parallel_case
        2'h0: // req 1
            begin
            xstate_next__var = 2'h2;
            mem_oe__var = 1'h1;
            mem_add__var = 16'h0;
            end
        2'h1: // req 1
            begin
            xstate_next__var = 2'h1;
            mem_add__var = 16'hffff;
            end
        2'h2: // req 1
            begin
            xstate_next__var = 2'h3;
            case (inst[15:12]) //synopsys parallel_case
            4'h4: // req 1
                begin
                case (inst[3:0]) //synopsys parallel_case
                4'h0: // req 1
                    begin
                    mem_add__var = reg__value[inst[7:4]];
                    mem_oe__var = 1'h1;
                    end
                4'h6: // req 1
                    begin
                    end
                4'h8: // req 1
                    begin
                    mem_add__var = reg__value[inst[11:8]];
                    mem_we__var = 1'h1;
                    mem_out__var = reg__value[inst[7:4]];
                    end
                default: // req 1
                    begin
                    end
                endcase
                end
            4'h6: // req 1
                begin
                case (inst[3:0]) //synopsys parallel_case
                4'h8: // req 1
                    begin
                    op_a__var = 17'h1;
                    op_b__var = {1'h0,reg__value[inst[7:4]]};
                    op_res__var = (op_a__var+op_b__var);
                    end
                4'h9: // req 1
                    begin
                    op_a__var = {1'h0,reg__value[inst[7:4]]};
                    op_b__var = 17'h1;
                    op_res__var = (op_a__var-op_b__var);
                    end
                default: // req 1
                    begin
                    end
                endcase
                end
            4'h8: // req 1
                begin
                end
            4'h9: // req 1
                begin
                end
            4'ha: // req 1
                begin
                end
            4'hb: // req 1
                begin
                end
            4'hf: // req 1
                begin
                xstate_next__var = 2'h1;
                end
            default: // req 1
                begin
                end
            endcase
            end
        default: // req 1
            begin
            xstate_next__var = 2'h2;
            mem_oe__var = 1'h1;
            mem_fetch__var = 1'h0;
            mem_add__var = reg__value[0];
            case (inst[15:12]) //synopsys parallel_case
            4'hc: // req 1
                begin
                pc_next__var = (reg__value[0]+16'h1);
                case (inst[11:8]) //synopsys parallel_case
                4'h0: // req 1
                    begin
                    pc_temp__var = (reg__value[0]+{{{{{{{{inst[7],inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7:0]});
                    mem_add__var = pc_temp__var;
                    pc_next__var = (pc_temp__var+16'h1);
                    end
                4'h2: // req 1
                    begin
                    if ((reg__value[1][0]==1'h0))
                    begin
                        pc_temp__var = (reg__value[0]+{{{{{{{{inst[7],inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7:0]});
                        mem_add__var = pc_temp__var;
                        pc_next__var = (pc_temp__var+16'h1);
                    end //if
                    end
                default: // req 1
                    begin
                    end
                endcase
                end
            default: // req 1
                begin
                end
            endcase
            end
        endcase
        pc_next = pc_next__var;
        pc_temp = pc_temp__var;
        mem_oe = mem_oe__var;
        mem_we = mem_we__var;
        mem_add = mem_add__var;
        mem_out = mem_out__var;
        mem_fetch = mem_fetch__var;
        op_a = op_a__var;
        op_b = op_b__var;
        op_res = op_res__var;
        xstate_next = xstate_next__var;
    end //always

    //b the_code__posedge_clock_in_active_low_reset_in clock process
    always @( posedge clock_in or negedge reset_in)
    begin : the_code__posedge_clock_in_active_low_reset_in__code
        if (reset_in==1'b0)
        begin
            inst <= 16'hffff;
            reg__value[0] <= 16'h0;
            reg__value[1] <= 16'h0;
            reg__value[2] <= 16'h0;
            reg__value[3] <= 16'h0;
            reg__value[4] <= 16'h0;
            reg__value[5] <= 16'h0;
            reg__value[6] <= 16'h0;
            reg__value[7] <= 16'h0;
            reg__value[8] <= 16'h0;
            reg__value[9] <= 16'h0;
            reg__value[10] <= 16'h0;
            reg__value[11] <= 16'h0;
            reg__value[12] <= 16'h0;
            reg__value[13] <= 16'h0;
            reg__value[14] <= 16'h0;
            reg__value[15] <= 16'h0;
            xstate <= 2'h0;
        end
        else
        begin
            case (xstate) //synopsys parallel_case
            2'h0: // req 1
                begin
                inst <= mem_in;
                reg__value[0] <= 16'h1;
                reg__value[1] <= 16'h0;
                reg__value[2] <= 16'h0;
                reg__value[3] <= 16'h0;
                reg__value[4] <= 16'h0;
                reg__value[5] <= 16'h0;
                reg__value[6] <= 16'h0;
                reg__value[7] <= 16'h0;
                reg__value[8] <= 16'h0;
                reg__value[9] <= 16'h0;
                reg__value[10] <= 16'h0;
                reg__value[11] <= 16'h0;
                reg__value[12] <= 16'h0;
                reg__value[13] <= 16'h0;
                reg__value[14] <= 16'h0;
                reg__value[15] <= 16'h0;
                end
            2'h1: // req 1
                begin
                inst <= inst;
                reg__value[0] <= 16'hffff;
                end
            2'h2: // req 1
                begin
                inst <= inst;
                case (inst[15:12]) //synopsys parallel_case
                4'h4: // req 1
                    begin
                    case (inst[3:0]) //synopsys parallel_case
                    4'h0: // req 1
                        begin
                        reg__value[inst[11:8]] <= mem_in;
                        end
                    4'h6: // req 1
                        begin
                        reg__value[inst[11:8]] <= reg__value[inst[7:4]];
                        end
                    4'h8: // req 1
                        begin
                        end
                    default: // req 1
                        begin
                        end
                    endcase
                    end
                4'h6: // req 1
                    begin
                    case (inst[3:0]) //synopsys parallel_case
                    4'h8: // req 1
                        begin
                        reg__value[1][1] <= op_res[16];
                        reg__value[1][2] <= op_res[15];
                        if ((op_res[15:0]==16'h0))
                        begin
                            reg__value[1][0] <= 1'h1;
                        end //if
                        else
                        begin
                            reg__value[1][0] <= 1'h0;
                        end //else
                        if (((op_a[15]==op_b[15])&&(op_res[15]!=op_b[15])))
                        begin
                            reg__value[1][3] <= 1'h1;
                        end //if
                        else
                        begin
                            reg__value[1][3] <= 1'h0;
                        end //else
                        reg__value[inst[11:8]] <= op_res[15:0];
                        end
                    4'h9: // req 1
                        begin
                        reg__value[1][1] <= ~op_res[16];
                        reg__value[1][2] <= op_res[15];
                        if ((op_res[15:0]==16'h0))
                        begin
                            reg__value[1][0] <= 1'h1;
                        end //if
                        else
                        begin
                            reg__value[1][0] <= 1'h0;
                        end //else
                        if (((op_a[15]!=op_b[15])&&(op_res[15]==op_b[15])))
                        begin
                            reg__value[1][3] <= 1'h1;
                        end //if
                        else
                        begin
                            reg__value[1][3] <= 1'h0;
                        end //else
                        reg__value[inst[11:8]] <= op_res[15:0];
                        end
                    default: // req 1
                        begin
                        end
                    endcase
                    end
                4'h8: // req 1
                    begin
                    reg__value[inst[11:8]][15:8] <= 8'h0;
                    reg__value[inst[11:8]][7:0] <= inst[7:0];
                    end
                4'h9: // req 1
                    begin
                    reg__value[inst[11:8]][15:8] <= inst[7:0];
                    reg__value[inst[11:8]][7:0] <= 8'h0;
                    end
                4'ha: // req 1
                    begin
                    reg__value[inst[11:8]][7:0] <= inst[7:0];
                    end
                4'hb: // req 1
                    begin
                    reg__value[inst[11:8]][15:8] <= inst[7:0];
                    end
                4'hf: // req 1
                    begin
                    end
                default: // req 1
                    begin
                    end
                endcase
                end
            default: // req 1
                begin
                reg__value[0] <= (reg__value[0]+16'h1);
                case (inst[15:12]) //synopsys parallel_case
                4'hc: // req 1
                    begin
                    reg__value[0] <= pc_next;
                    end
                default: // req 1
                    begin
                    end
                endcase
                inst <= mem_in;
                end
            endcase
            xstate <= xstate_next;
        end //if
    end //always

endmodule // lsa_core
