//a Note: created by CDL 1.3.6 - do not hand edit without recognizing it will be out of sync with the source
// Output mode 0 (VMOD=1, standard verilog=0)

//a Module lsa_core
module lsa_core
(
    in_clock,

    in_reset

);

    //b Clocks
    input in_clock;

    //b Inputs
    input in_reset;

    //b Outputs

// output components here

    //b Output combinatorials

    //b Output nets

    //b Internal and output registers
    reg [7:0]leds;
    reg [15:0]inst;
    reg [6:0]astate;
    reg [15:0]reg__value[15:0];

    //b Internal combinatorials
    reg mem_fetch;
    reg mem_rd;
    reg mem_wr;
    reg [15:0]mem_wdata;
    reg [15:0]mem_rdata;
    reg [15:0]mem_add;
    reg tbit;
    reg [15:0]tword;
    reg [3:0]shift_amt;
    reg [16:0]op_res;
    reg [16:0]op_b;
    reg [16:0]op_a;
    reg [6:0]astate_next;
    reg [15:0]pc_next;

    //b Internal nets

    //b Clock gating module instances
    //b Module instances
    //b the_mem__comb combinatorial process
    always @( //the_mem__comb
        mem_rd or
        mem_add )
    begin: the_mem__comb_code
    reg [15:0]mem_rdata__var;
        mem_rdata__var = 16'h0;
        if ((mem_rd==1'h1))
        begin
            case (mem_add) //synopsys parallel_case
            16'h0: // req 1
                begin
                mem_rdata__var = 16'hc001;
                end
            16'h1: // req 1
                begin
                mem_rdata__var = 16'hc000;
                end
            16'h2: // req 1
                begin
                mem_rdata__var = 16'h97f1;
                end
            16'h3: // req 1
                begin
                mem_rdata__var = 16'h8500;
                end
            16'h4: // req 1
                begin
                mem_rdata__var = 16'h8820;
                end
            16'h5: // req 1
                begin
                mem_rdata__var = 16'h6889;
                end
            16'h6: // req 1
                begin
                mem_rdata__var = 16'hc2fe;
                end
            16'h7: // req 1
                begin
                mem_rdata__var = 16'h6558;
                end
            16'h8: // req 1
                begin
                mem_rdata__var = 16'h4758;
                end
            16'h9: // req 1
                begin
                mem_rdata__var = 16'h8820;
                end
            16'ha: // req 1
                begin
                mem_rdata__var = 16'hc0fa;
                end
            default: // req 1
                begin
                mem_rdata__var = 16'h0;
                end
            endcase
        end //if
        mem_rdata = mem_rdata__var;
    end //always

    //b the_mem__posedge_in_clock_active_low_in_reset clock process
    always @( posedge in_clock or negedge in_reset)
    begin : the_mem__posedge_in_clock_active_low_in_reset__code
        if (in_reset==1'b0)
        begin
            leds <= 8'h0;
        end
        else
        begin
            if ((mem_wr==1'h1))
            begin
                case (mem_add) //synopsys parallel_case
                16'hf100: // req 1
                    begin
                    leds <= mem_wdata[7:0];
                    end
                default: // req 1
                    begin
                    end
                endcase
            end //if
        end //if
    end //always

    //b the_code__comb combinatorial process
    always @( //the_code__comb
        astate or
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
        reg__value[15] or
        inst )
    begin: the_code__comb_code
    reg [15:0]mem_add__var;
    reg [15:0]mem_wdata__var;
    reg mem_wr__var;
    reg mem_rd__var;
    reg mem_fetch__var;
    reg [6:0]astate_next__var;
    reg [15:0]pc_next__var;
    reg tbit__var;
    reg [3:0]shift_amt__var;
    reg [16:0]op_a__var;
    reg [16:0]op_b__var;
    reg [16:0]op_res__var;
        mem_add__var = 16'h0;
        mem_wdata__var = 16'h0;
        mem_wr__var = 1'h0;
        mem_rd__var = 1'h0;
        mem_fetch__var = 1'h0;
        astate_next__var = astate;
        pc_next__var = reg__value[0];
        tbit__var = 1'h0;
        shift_amt__var = 4'h0;
        case (astate) //synopsys parallel_case
        7'h1: // req 1
            begin
            astate_next__var = 7'h2;
            end
        7'h2: // req 1
            begin
            pc_next__var = 16'h0;
            astate_next__var = 7'h4;
            end
        7'h4: // req 1
            begin
            pc_next__var = (reg__value[0]+16'h1);
            mem_add__var = reg__value[0];
            mem_fetch__var = 1'h1;
            mem_rd__var = 1'h1;
            astate_next__var = 7'h8;
            end
        7'h8: // req 1
            begin
            astate_next__var = 7'h40;
            case (inst[15:12]) //synopsys parallel_case
            4'h0: // req 1
                begin
                astate_next__var = 7'h20;
                mem_add__var = (reg__value[0]+{8'h0,inst[7:0]});
                mem_rd__var = 1'h1;
                end
            4'h1: // req 1
                begin
                astate_next__var = 7'h20;
                mem_add__var = (reg__value[2]+{8'h0,inst[7:0]});
                mem_rd__var = 1'h1;
                end
            4'h2: // req 1
                begin
                astate_next__var = 7'h10;
                mem_add__var = (reg__value[0]+{8'h0,inst[7:0]});
                mem_wr__var = 1'h1;
                mem_wdata__var = reg__value[inst[11:8]];
                end
            4'h3: // req 1
                begin
                astate_next__var = 7'h10;
                mem_add__var = (reg__value[2]+{8'h0,inst[7:0]});
                mem_wr__var = 1'h1;
                mem_wdata__var = reg__value[inst[11:8]];
                end
            4'h4: // req 1
                begin
                case (inst[3:0]) //synopsys parallel_case
                4'h0: // req 1
                    begin
                    astate_next__var = 7'h20;
                    mem_add__var = reg__value[inst[7:4]];
                    mem_rd__var = 1'h1;
                    end
                4'h1: // req 1
                    begin
                    astate_next__var = 7'h20;
                    mem_add__var = reg__value[inst[7:4]];
                    mem_rd__var = 1'h1;
                    end
                4'h2: // req 1
                    begin
                    astate_next__var = 7'h20;
                    mem_add__var = (reg__value[inst[7:4]]+16'h1);
                    mem_rd__var = 1'h1;
                    end
                4'h3: // req 1
                    begin
                    astate_next__var = 7'h20;
                    mem_add__var = reg__value[inst[7:4]];
                    mem_rd__var = 1'h1;
                    end
                4'h4: // req 1
                    begin
                    astate_next__var = 7'h20;
                    mem_add__var = (reg__value[inst[7:4]]-16'h1);
                    mem_rd__var = 1'h1;
                    end
                4'h6: // req 1
                    begin
                    astate_next__var = 7'h4;
                    end
                4'h8: // req 1
                    begin
                    astate_next__var = 7'h10;
                    mem_add__var = reg__value[inst[11:8]];
                    mem_wr__var = 1'h1;
                    mem_wdata__var = reg__value[inst[7:4]];
                    end
                4'h9: // req 1
                    begin
                    astate_next__var = 7'h10;
                    mem_add__var = reg__value[inst[11:8]];
                    mem_wr__var = 1'h1;
                    mem_wdata__var = reg__value[inst[7:4]];
                    end
                4'ha: // req 1
                    begin
                    astate_next__var = 7'h10;
                    mem_add__var = (reg__value[inst[11:8]]+16'h1);
                    mem_wr__var = 1'h1;
                    mem_wdata__var = reg__value[inst[7:4]];
                    end
                4'hb: // req 1
                    begin
                    astate_next__var = 7'h10;
                    mem_add__var = reg__value[inst[11:8]];
                    mem_wr__var = 1'h1;
                    mem_wdata__var = reg__value[inst[7:4]];
                    end
                4'hc: // req 1
                    begin
                    astate_next__var = 7'h10;
                    mem_add__var = (reg__value[inst[11:8]]-16'h1);
                    mem_wr__var = 1'h1;
                    mem_wdata__var = reg__value[inst[7:4]];
                    end
                4'he: // req 1
                    begin
                    astate_next__var = 7'h4;
                    tword = reg__value[inst[11:8]];
                    end
                default: // req 1
                    begin
                    astate_next__var = 7'h40;
                    end
                endcase
                end
            4'h5: // req 1
                begin
                astate_next__var = 7'h4;
                end
            4'h6: // req 1
                begin
                astate_next__var = 7'h4;
                case (inst[3:0]) //synopsys parallel_case
                4'h0: // req 1
                    begin
                    op_a__var = {1'h0,reg__value[inst[11:8]]};
                    op_b__var = {1'h0,reg__value[inst[7:4]]};
                    op_res__var = (op_a__var+op_b__var);
                    end
                4'h1: // req 1
                    begin
                    op_a__var = {1'h0,reg__value[inst[11:8]]};
                    op_b__var = {1'h0,reg__value[inst[7:4]]};
                    op_res__var = (op_a__var-op_b__var);
                    end
                4'h2: // req 1
                    begin
                    op_a__var = {1'h0,reg__value[inst[11:8]]};
                    op_b__var = {1'h0,reg__value[inst[7:4]]};
                    op_res__var = (op_a__var & op_b__var);
                    end
                4'h3: // req 1
                    begin
                    op_a__var = {1'h0,reg__value[inst[11:8]]};
                    op_b__var = {1'h0,reg__value[inst[7:4]]};
                    op_res__var = (op_a__var & ~op_b__var);
                    end
                4'h4: // req 1
                    begin
                    op_a__var = {1'h0,reg__value[inst[11:8]]};
                    op_b__var = {1'h0,reg__value[inst[7:4]]};
                    op_res__var = (op_a__var | op_b__var);
                    end
                4'h5: // req 1
                    begin
                    op_a__var = {1'h0,reg__value[inst[11:8]]};
                    op_b__var = {1'h0,reg__value[inst[7:4]]};
                    op_res__var = (op_a__var ^ op_b__var);
                    end
                4'h6: // req 1
                    begin
                    op_a__var = 17'h0;
                    op_b__var = {1'h0,reg__value[inst[7:4]]};
                    op_res__var = (op_a__var-op_b__var);
                    end
                4'h7: // req 1
                    begin
                    op_b__var = {1'h0,reg__value[inst[7:4]]};
                    op_res__var = ~op_b__var;
                    end
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
                4'ha: // req 1
                    begin
                    op_a__var = {1'h0,reg__value[inst[11:8]]};
                    op_b__var = {1'h0,reg__value[inst[7:4]]};
                    op_res__var = (op_a__var-op_b__var);
                    end
                4'hb: // req 1
                    begin
                    op_a__var = {1'h0,reg__value[inst[11:8]]};
                    op_b__var = {1'h0,reg__value[inst[7:4]]};
                    op_res__var = (op_a__var & op_b__var);
                    end
                default: // req 1
                    begin
                    astate_next__var = 7'h40;
                    end
                endcase
                end
            4'h7: // req 1
                begin
                astate_next__var = 7'h4;
                case (inst[3:3]) //synopsys parallel_case
                1'h0: // req 1
                    begin
                    shift_amt__var = reg__value[inst[7:4]][3:0];
                    end
                default: // req 1
                    begin
                    shift_amt__var = inst[7:4];
                    end
                endcase
                case (inst[2:0]) //synopsys parallel_case
                3'h0: // req 1
                    begin
                    op_res__var[16] = 1'h0;
                    case (shift_amt__var) //synopsys parallel_case
                    4'h1: // req 1
                        begin
                        op_res__var[15:15] = 1'h0;
                        op_res__var[14:0] = reg__value[inst[11:8]][15:1];
                        end
                    4'h2: // req 1
                        begin
                        op_res__var[15:14] = 2'h0;
                        op_res__var[13:0] = reg__value[inst[11:8]][15:2];
                        end
                    4'h3: // req 1
                        begin
                        op_res__var[15:13] = 3'h0;
                        op_res__var[12:0] = reg__value[inst[11:8]][15:3];
                        end
                    4'h4: // req 1
                        begin
                        op_res__var[15:12] = 4'h0;
                        op_res__var[11:0] = reg__value[inst[11:8]][15:4];
                        end
                    4'h5: // req 1
                        begin
                        op_res__var[15:11] = 5'h0;
                        op_res__var[10:0] = reg__value[inst[11:8]][15:5];
                        end
                    4'h6: // req 1
                        begin
                        op_res__var[15:10] = 6'h0;
                        op_res__var[9:0] = reg__value[inst[11:8]][15:6];
                        end
                    4'h7: // req 1
                        begin
                        op_res__var[15:9] = 7'h0;
                        op_res__var[8:0] = reg__value[inst[11:8]][15:7];
                        end
                    4'h8: // req 1
                        begin
                        op_res__var[15:8] = 8'h0;
                        op_res__var[7:0] = reg__value[inst[11:8]][15:8];
                        end
                    4'h9: // req 1
                        begin
                        op_res__var[15:7] = 9'h0;
                        op_res__var[6:0] = reg__value[inst[11:8]][15:9];
                        end
                    4'ha: // req 1
                        begin
                        op_res__var[15:6] = 10'h0;
                        op_res__var[5:0] = reg__value[inst[11:8]][15:10];
                        end
                    4'hb: // req 1
                        begin
                        op_res__var[15:5] = 11'h0;
                        op_res__var[4:0] = reg__value[inst[11:8]][15:11];
                        end
                    4'hc: // req 1
                        begin
                        op_res__var[15:4] = 12'h0;
                        op_res__var[3:0] = reg__value[inst[11:8]][15:12];
                        end
                    4'hd: // req 1
                        begin
                        op_res__var[15:3] = 13'h0;
                        op_res__var[2:0] = reg__value[inst[11:8]][15:13];
                        end
                    4'he: // req 1
                        begin
                        op_res__var[15:2] = 14'h0;
                        op_res__var[1:0] = reg__value[inst[11:8]][15:14];
                        end
                    4'hf: // req 1
                        begin
                        op_res__var[15:1] = 15'h0;
                        op_res__var[0:0] = reg__value[inst[11:8]][15:15];
                        end
                    default: // req 1
                        begin
                        op_res__var[15:0] = reg__value[inst[11:8]];
                        end
                    endcase
                    end
                3'h1: // req 1
                    begin
                    op_res__var[16] = 1'h0;
                    case ({reg__value[inst[11:8]][15],shift_amt__var}) //synopsys parallel_case
                    5'h1: // req 1
                        begin
                        op_res__var[15:15] = 1'h0;
                        op_res__var[14:0] = reg__value[inst[11:8]][15:1];
                        end
                    5'h2: // req 1
                        begin
                        op_res__var[15:14] = 2'h0;
                        op_res__var[13:0] = reg__value[inst[11:8]][15:2];
                        end
                    5'h3: // req 1
                        begin
                        op_res__var[15:13] = 3'h0;
                        op_res__var[12:0] = reg__value[inst[11:8]][15:3];
                        end
                    5'h4: // req 1
                        begin
                        op_res__var[15:12] = 4'h0;
                        op_res__var[11:0] = reg__value[inst[11:8]][15:4];
                        end
                    5'h5: // req 1
                        begin
                        op_res__var[15:11] = 5'h0;
                        op_res__var[10:0] = reg__value[inst[11:8]][15:5];
                        end
                    5'h6: // req 1
                        begin
                        op_res__var[15:10] = 6'h0;
                        op_res__var[9:0] = reg__value[inst[11:8]][15:6];
                        end
                    5'h7: // req 1
                        begin
                        op_res__var[15:9] = 7'h0;
                        op_res__var[8:0] = reg__value[inst[11:8]][15:7];
                        end
                    5'h8: // req 1
                        begin
                        op_res__var[15:8] = 8'h0;
                        op_res__var[7:0] = reg__value[inst[11:8]][15:8];
                        end
                    5'h9: // req 1
                        begin
                        op_res__var[15:7] = 9'h0;
                        op_res__var[6:0] = reg__value[inst[11:8]][15:9];
                        end
                    5'ha: // req 1
                        begin
                        op_res__var[15:6] = 10'h0;
                        op_res__var[5:0] = reg__value[inst[11:8]][15:10];
                        end
                    5'hb: // req 1
                        begin
                        op_res__var[15:5] = 11'h0;
                        op_res__var[4:0] = reg__value[inst[11:8]][15:11];
                        end
                    5'hc: // req 1
                        begin
                        op_res__var[15:4] = 12'h0;
                        op_res__var[3:0] = reg__value[inst[11:8]][15:12];
                        end
                    5'hd: // req 1
                        begin
                        op_res__var[15:3] = 13'h0;
                        op_res__var[2:0] = reg__value[inst[11:8]][15:13];
                        end
                    5'he: // req 1
                        begin
                        op_res__var[15:2] = 14'h0;
                        op_res__var[1:0] = reg__value[inst[11:8]][15:14];
                        end
                    5'hf: // req 1
                        begin
                        op_res__var[15:1] = 15'h0;
                        op_res__var[0:0] = reg__value[inst[11:8]][15:15];
                        end
                    5'h11: // req 1
                        begin
                        op_res__var[15:15] = 1'h1;
                        op_res__var[14:0] = reg__value[inst[11:8]][15:1];
                        end
                    5'h12: // req 1
                        begin
                        op_res__var[15:14] = 2'h3;
                        op_res__var[13:0] = reg__value[inst[11:8]][15:2];
                        end
                    5'h13: // req 1
                        begin
                        op_res__var[15:13] = 3'h7;
                        op_res__var[12:0] = reg__value[inst[11:8]][15:3];
                        end
                    5'h14: // req 1
                        begin
                        op_res__var[15:12] = 4'hf;
                        op_res__var[11:0] = reg__value[inst[11:8]][15:4];
                        end
                    5'h15: // req 1
                        begin
                        op_res__var[15:11] = 5'h1f;
                        op_res__var[10:0] = reg__value[inst[11:8]][15:5];
                        end
                    5'h16: // req 1
                        begin
                        op_res__var[15:10] = 6'h3f;
                        op_res__var[9:0] = reg__value[inst[11:8]][15:6];
                        end
                    5'h17: // req 1
                        begin
                        op_res__var[15:9] = 7'h7f;
                        op_res__var[8:0] = reg__value[inst[11:8]][15:7];
                        end
                    5'h18: // req 1
                        begin
                        op_res__var[15:8] = 8'hff;
                        op_res__var[7:0] = reg__value[inst[11:8]][15:8];
                        end
                    5'h19: // req 1
                        begin
                        op_res__var[15:7] = 9'h1ff;
                        op_res__var[6:0] = reg__value[inst[11:8]][15:9];
                        end
                    5'h1a: // req 1
                        begin
                        op_res__var[15:6] = 10'h3ff;
                        op_res__var[5:0] = reg__value[inst[11:8]][15:10];
                        end
                    5'h1b: // req 1
                        begin
                        op_res__var[15:5] = 11'h7ff;
                        op_res__var[4:0] = reg__value[inst[11:8]][15:11];
                        end
                    5'h1c: // req 1
                        begin
                        op_res__var[15:4] = 12'hfff;
                        op_res__var[3:0] = reg__value[inst[11:8]][15:12];
                        end
                    5'h1d: // req 1
                        begin
                        op_res__var[15:3] = 13'h1fff;
                        op_res__var[2:0] = reg__value[inst[11:8]][15:13];
                        end
                    5'h1e: // req 1
                        begin
                        op_res__var[15:2] = 14'h3fff;
                        op_res__var[1:0] = reg__value[inst[11:8]][15:14];
                        end
                    5'h1f: // req 1
                        begin
                        op_res__var[15:1] = 15'h7fff;
                        op_res__var[0:0] = reg__value[inst[11:8]][15:15];
                        end
                    default: // req 1
                        begin
                        op_res__var[15:0] = reg__value[inst[11:8]];
                        end
                    endcase
                    end
                3'h2: // req 1
                    begin
                    op_res__var[16] = 1'h0;
                    case (shift_amt__var) //synopsys parallel_case
                    4'h1: // req 1
                        begin
                        op_res__var[15:1] = reg__value[inst[11:8]][14:0];
                        op_res__var[0:0] = 1'h0;
                        end
                    4'h2: // req 1
                        begin
                        op_res__var[15:2] = reg__value[inst[11:8]][13:0];
                        op_res__var[1:0] = 2'h0;
                        end
                    4'h3: // req 1
                        begin
                        op_res__var[15:3] = reg__value[inst[11:8]][12:0];
                        op_res__var[2:0] = 3'h0;
                        end
                    4'h4: // req 1
                        begin
                        op_res__var[15:4] = reg__value[inst[11:8]][11:0];
                        op_res__var[3:0] = 4'h0;
                        end
                    4'h5: // req 1
                        begin
                        op_res__var[15:5] = reg__value[inst[11:8]][10:0];
                        op_res__var[4:0] = 5'h0;
                        end
                    4'h6: // req 1
                        begin
                        op_res__var[15:6] = reg__value[inst[11:8]][9:0];
                        op_res__var[5:0] = 6'h0;
                        end
                    4'h7: // req 1
                        begin
                        op_res__var[15:7] = reg__value[inst[11:8]][8:0];
                        op_res__var[6:0] = 7'h0;
                        end
                    4'h8: // req 1
                        begin
                        op_res__var[15:8] = reg__value[inst[11:8]][7:0];
                        op_res__var[7:0] = 8'h0;
                        end
                    4'h9: // req 1
                        begin
                        op_res__var[15:9] = reg__value[inst[11:8]][6:0];
                        op_res__var[8:0] = 9'h0;
                        end
                    4'ha: // req 1
                        begin
                        op_res__var[15:10] = reg__value[inst[11:8]][5:0];
                        op_res__var[9:0] = 10'h0;
                        end
                    4'hb: // req 1
                        begin
                        op_res__var[15:11] = reg__value[inst[11:8]][4:0];
                        op_res__var[10:0] = 11'h0;
                        end
                    4'hc: // req 1
                        begin
                        op_res__var[15:12] = reg__value[inst[11:8]][3:0];
                        op_res__var[11:0] = 12'h0;
                        end
                    4'hd: // req 1
                        begin
                        op_res__var[15:13] = reg__value[inst[11:8]][2:0];
                        op_res__var[12:0] = 13'h0;
                        end
                    4'he: // req 1
                        begin
                        op_res__var[15:14] = reg__value[inst[11:8]][1:0];
                        op_res__var[13:0] = 14'h0;
                        end
                    4'hf: // req 1
                        begin
                        op_res__var[15:15] = reg__value[inst[11:8]][0:0];
                        op_res__var[14:0] = 15'h0;
                        end
                    default: // req 1
                        begin
                        op_res__var[15:0] = reg__value[inst[11:8]];
                        end
                    endcase
                    end
                3'h3: // req 1
                    begin
                    case (shift_amt__var) //synopsys parallel_case
                    4'h1: // req 1
                        begin
                        op_res__var[14:0] = reg__value[inst[11:8]][15:1];
                        op_res__var[15:15] = reg__value[inst[11:8]][0:0];
                        end
                    4'h2: // req 1
                        begin
                        op_res__var[13:0] = reg__value[inst[11:8]][15:2];
                        op_res__var[15:14] = reg__value[inst[11:8]][1:0];
                        end
                    4'h3: // req 1
                        begin
                        op_res__var[12:0] = reg__value[inst[11:8]][15:3];
                        op_res__var[15:13] = reg__value[inst[11:8]][2:0];
                        end
                    4'h4: // req 1
                        begin
                        op_res__var[11:0] = reg__value[inst[11:8]][15:4];
                        op_res__var[15:12] = reg__value[inst[11:8]][3:0];
                        end
                    4'h5: // req 1
                        begin
                        op_res__var[10:0] = reg__value[inst[11:8]][15:5];
                        op_res__var[15:11] = reg__value[inst[11:8]][4:0];
                        end
                    4'h6: // req 1
                        begin
                        op_res__var[9:0] = reg__value[inst[11:8]][15:6];
                        op_res__var[15:10] = reg__value[inst[11:8]][5:0];
                        end
                    4'h7: // req 1
                        begin
                        op_res__var[8:0] = reg__value[inst[11:8]][15:7];
                        op_res__var[15:9] = reg__value[inst[11:8]][6:0];
                        end
                    4'h8: // req 1
                        begin
                        op_res__var[7:0] = reg__value[inst[11:8]][15:8];
                        op_res__var[15:8] = reg__value[inst[11:8]][7:0];
                        end
                    4'h9: // req 1
                        begin
                        op_res__var[6:0] = reg__value[inst[11:8]][15:9];
                        op_res__var[15:7] = reg__value[inst[11:8]][8:0];
                        end
                    4'ha: // req 1
                        begin
                        op_res__var[5:0] = reg__value[inst[11:8]][15:10];
                        op_res__var[15:6] = reg__value[inst[11:8]][9:0];
                        end
                    4'hb: // req 1
                        begin
                        op_res__var[4:0] = reg__value[inst[11:8]][15:11];
                        op_res__var[15:5] = reg__value[inst[11:8]][10:0];
                        end
                    4'hc: // req 1
                        begin
                        op_res__var[3:0] = reg__value[inst[11:8]][15:12];
                        op_res__var[15:4] = reg__value[inst[11:8]][11:0];
                        end
                    4'hd: // req 1
                        begin
                        op_res__var[2:0] = reg__value[inst[11:8]][15:13];
                        op_res__var[15:3] = reg__value[inst[11:8]][12:0];
                        end
                    4'he: // req 1
                        begin
                        op_res__var[1:0] = reg__value[inst[11:8]][15:14];
                        op_res__var[15:2] = reg__value[inst[11:8]][13:0];
                        end
                    4'hf: // req 1
                        begin
                        op_res__var[0:0] = reg__value[inst[11:8]][15:15];
                        op_res__var[15:1] = reg__value[inst[11:8]][14:0];
                        end
                    default: // req 1
                        begin
                        op_res__var[15:0] = reg__value[inst[11:8]];
                        end
                    endcase
                    end
                3'h4: // req 1
                    begin
                    case (shift_amt__var) //synopsys parallel_case
                    4'h1: // req 1
                        begin
                        op_res__var[15:1] = reg__value[inst[11:8]][14:0];
                        op_res__var[0:0] = reg__value[inst[11:8]][15:15];
                        end
                    4'h2: // req 1
                        begin
                        op_res__var[15:2] = reg__value[inst[11:8]][13:0];
                        op_res__var[1:0] = reg__value[inst[11:8]][15:14];
                        end
                    4'h3: // req 1
                        begin
                        op_res__var[15:3] = reg__value[inst[11:8]][12:0];
                        op_res__var[2:0] = reg__value[inst[11:8]][15:13];
                        end
                    4'h4: // req 1
                        begin
                        op_res__var[15:4] = reg__value[inst[11:8]][11:0];
                        op_res__var[3:0] = reg__value[inst[11:8]][15:12];
                        end
                    4'h5: // req 1
                        begin
                        op_res__var[15:5] = reg__value[inst[11:8]][10:0];
                        op_res__var[4:0] = reg__value[inst[11:8]][15:11];
                        end
                    4'h6: // req 1
                        begin
                        op_res__var[15:6] = reg__value[inst[11:8]][9:0];
                        op_res__var[5:0] = reg__value[inst[11:8]][15:10];
                        end
                    4'h7: // req 1
                        begin
                        op_res__var[15:7] = reg__value[inst[11:8]][8:0];
                        op_res__var[6:0] = reg__value[inst[11:8]][15:9];
                        end
                    4'h8: // req 1
                        begin
                        op_res__var[15:8] = reg__value[inst[11:8]][7:0];
                        op_res__var[7:0] = reg__value[inst[11:8]][15:8];
                        end
                    4'h9: // req 1
                        begin
                        op_res__var[15:9] = reg__value[inst[11:8]][6:0];
                        op_res__var[8:0] = reg__value[inst[11:8]][15:7];
                        end
                    4'ha: // req 1
                        begin
                        op_res__var[15:10] = reg__value[inst[11:8]][5:0];
                        op_res__var[9:0] = reg__value[inst[11:8]][15:6];
                        end
                    4'hb: // req 1
                        begin
                        op_res__var[15:11] = reg__value[inst[11:8]][4:0];
                        op_res__var[10:0] = reg__value[inst[11:8]][15:5];
                        end
                    4'hc: // req 1
                        begin
                        op_res__var[15:12] = reg__value[inst[11:8]][3:0];
                        op_res__var[11:0] = reg__value[inst[11:8]][15:4];
                        end
                    4'hd: // req 1
                        begin
                        op_res__var[15:13] = reg__value[inst[11:8]][2:0];
                        op_res__var[12:0] = reg__value[inst[11:8]][15:3];
                        end
                    4'he: // req 1
                        begin
                        op_res__var[15:14] = reg__value[inst[11:8]][1:0];
                        op_res__var[13:0] = reg__value[inst[11:8]][15:2];
                        end
                    4'hf: // req 1
                        begin
                        op_res__var[15:15] = reg__value[inst[11:8]][0:0];
                        op_res__var[14:0] = reg__value[inst[11:8]][15:1];
                        end
                    default: // req 1
                        begin
                        op_res__var[15:0] = reg__value[inst[11:8]];
                        end
                    endcase
                    end
                3'h5: // req 1
                    begin
                    case (shift_amt__var) //synopsys parallel_case
                    4'h1: // req 1
                        begin
                        op_res__var[15] = reg__value[1][1];
                        op_res__var[14:0] = reg__value[inst[11:8]][15:1];
                        op_res__var[16:16] = reg__value[inst[11:8]][0:0];
                        end
                    4'h2: // req 1
                        begin
                        op_res__var[14] = reg__value[1][1];
                        op_res__var[13:0] = reg__value[inst[11:8]][15:2];
                        op_res__var[16:15] = reg__value[inst[11:8]][1:0];
                        end
                    4'h3: // req 1
                        begin
                        op_res__var[13] = reg__value[1][1];
                        op_res__var[12:0] = reg__value[inst[11:8]][15:3];
                        op_res__var[16:14] = reg__value[inst[11:8]][2:0];
                        end
                    4'h4: // req 1
                        begin
                        op_res__var[12] = reg__value[1][1];
                        op_res__var[11:0] = reg__value[inst[11:8]][15:4];
                        op_res__var[16:13] = reg__value[inst[11:8]][3:0];
                        end
                    4'h5: // req 1
                        begin
                        op_res__var[11] = reg__value[1][1];
                        op_res__var[10:0] = reg__value[inst[11:8]][15:5];
                        op_res__var[16:12] = reg__value[inst[11:8]][4:0];
                        end
                    4'h6: // req 1
                        begin
                        op_res__var[10] = reg__value[1][1];
                        op_res__var[9:0] = reg__value[inst[11:8]][15:6];
                        op_res__var[16:11] = reg__value[inst[11:8]][5:0];
                        end
                    4'h7: // req 1
                        begin
                        op_res__var[9] = reg__value[1][1];
                        op_res__var[8:0] = reg__value[inst[11:8]][15:7];
                        op_res__var[16:10] = reg__value[inst[11:8]][6:0];
                        end
                    4'h8: // req 1
                        begin
                        op_res__var[8] = reg__value[1][1];
                        op_res__var[7:0] = reg__value[inst[11:8]][15:8];
                        op_res__var[16:9] = reg__value[inst[11:8]][7:0];
                        end
                    4'h9: // req 1
                        begin
                        op_res__var[7] = reg__value[1][1];
                        op_res__var[6:0] = reg__value[inst[11:8]][15:9];
                        op_res__var[16:8] = reg__value[inst[11:8]][8:0];
                        end
                    4'ha: // req 1
                        begin
                        op_res__var[6] = reg__value[1][1];
                        op_res__var[5:0] = reg__value[inst[11:8]][15:10];
                        op_res__var[16:7] = reg__value[inst[11:8]][9:0];
                        end
                    4'hb: // req 1
                        begin
                        op_res__var[5] = reg__value[1][1];
                        op_res__var[4:0] = reg__value[inst[11:8]][15:11];
                        op_res__var[16:6] = reg__value[inst[11:8]][10:0];
                        end
                    4'hc: // req 1
                        begin
                        op_res__var[4] = reg__value[1][1];
                        op_res__var[3:0] = reg__value[inst[11:8]][15:12];
                        op_res__var[16:5] = reg__value[inst[11:8]][11:0];
                        end
                    4'hd: // req 1
                        begin
                        op_res__var[3] = reg__value[1][1];
                        op_res__var[2:0] = reg__value[inst[11:8]][15:13];
                        op_res__var[16:4] = reg__value[inst[11:8]][12:0];
                        end
                    4'he: // req 1
                        begin
                        op_res__var[2] = reg__value[1][1];
                        op_res__var[1:0] = reg__value[inst[11:8]][15:14];
                        op_res__var[16:3] = reg__value[inst[11:8]][13:0];
                        end
                    4'hf: // req 1
                        begin
                        op_res__var[1] = reg__value[1][1];
                        op_res__var[0:0] = reg__value[inst[11:8]][15:15];
                        op_res__var[16:2] = reg__value[inst[11:8]][14:0];
                        end
                    default: // req 1
                        begin
                        op_res__var[16] = reg__value[1][1];
                        op_res__var[15:0] = reg__value[inst[11:8]];
                        end
                    endcase
                    end
                3'h6: // req 1
                    begin
                    case (shift_amt__var) //synopsys parallel_case
                    4'h1: // req 1
                        begin
                        op_res__var[16:1] = reg__value[inst[11:8]][15:0];
                        op_res__var[0:0] = reg__value[1][1];
                        end
                    4'h2: // req 1
                        begin
                        op_res__var[16:2] = reg__value[inst[11:8]][14:0];
                        op_res__var[1:1] = reg__value[1][1];
                        op_res__var[0:0] = reg__value[inst[11:8]][15:15];
                        end
                    4'h3: // req 1
                        begin
                        op_res__var[16:3] = reg__value[inst[11:8]][13:0];
                        op_res__var[2:2] = reg__value[1][1];
                        op_res__var[1:0] = reg__value[inst[11:8]][15:14];
                        end
                    4'h4: // req 1
                        begin
                        op_res__var[16:4] = reg__value[inst[11:8]][12:0];
                        op_res__var[3:3] = reg__value[1][1];
                        op_res__var[2:0] = reg__value[inst[11:8]][15:13];
                        end
                    4'h5: // req 1
                        begin
                        op_res__var[16:5] = reg__value[inst[11:8]][11:0];
                        op_res__var[4:4] = reg__value[1][1];
                        op_res__var[3:0] = reg__value[inst[11:8]][15:12];
                        end
                    4'h6: // req 1
                        begin
                        op_res__var[16:6] = reg__value[inst[11:8]][10:0];
                        op_res__var[5:5] = reg__value[1][1];
                        op_res__var[4:0] = reg__value[inst[11:8]][15:11];
                        end
                    4'h7: // req 1
                        begin
                        op_res__var[16:7] = reg__value[inst[11:8]][9:0];
                        op_res__var[6:6] = reg__value[1][1];
                        op_res__var[5:0] = reg__value[inst[11:8]][15:10];
                        end
                    4'h8: // req 1
                        begin
                        op_res__var[16:8] = reg__value[inst[11:8]][8:0];
                        op_res__var[7:7] = reg__value[1][1];
                        op_res__var[6:0] = reg__value[inst[11:8]][15:9];
                        end
                    4'h9: // req 1
                        begin
                        op_res__var[16:9] = reg__value[inst[11:8]][7:0];
                        op_res__var[8:8] = reg__value[1][1];
                        op_res__var[7:0] = reg__value[inst[11:8]][15:8];
                        end
                    4'ha: // req 1
                        begin
                        op_res__var[16:10] = reg__value[inst[11:8]][6:0];
                        op_res__var[9:9] = reg__value[1][1];
                        op_res__var[8:0] = reg__value[inst[11:8]][15:7];
                        end
                    4'hb: // req 1
                        begin
                        op_res__var[16:11] = reg__value[inst[11:8]][5:0];
                        op_res__var[10:10] = reg__value[1][1];
                        op_res__var[9:0] = reg__value[inst[11:8]][15:6];
                        end
                    4'hc: // req 1
                        begin
                        op_res__var[16:12] = reg__value[inst[11:8]][4:0];
                        op_res__var[11:11] = reg__value[1][1];
                        op_res__var[10:0] = reg__value[inst[11:8]][15:5];
                        end
                    4'hd: // req 1
                        begin
                        op_res__var[16:13] = reg__value[inst[11:8]][3:0];
                        op_res__var[12:12] = reg__value[1][1];
                        op_res__var[11:0] = reg__value[inst[11:8]][15:4];
                        end
                    4'he: // req 1
                        begin
                        op_res__var[16:14] = reg__value[inst[11:8]][2:0];
                        op_res__var[13:13] = reg__value[1][1];
                        op_res__var[12:0] = reg__value[inst[11:8]][15:3];
                        end
                    4'hf: // req 1
                        begin
                        op_res__var[16:15] = reg__value[inst[11:8]][1:0];
                        op_res__var[14:14] = reg__value[1][1];
                        op_res__var[13:0] = reg__value[inst[11:8]][15:2];
                        end
                    default: // req 1
                        begin
                        op_res__var[16] = reg__value[1][1];
                        op_res__var[15:0] = reg__value[inst[11:8]];
                        end
                    endcase
                    end
                default: // req 1
                    begin
                    astate_next__var = 7'h40;
                    end
                endcase
                end
            4'h8: // req 1
                begin
                astate_next__var = 7'h4;
                end
            4'h9: // req 1
                begin
                astate_next__var = 7'h4;
                end
            4'ha: // req 1
                begin
                astate_next__var = 7'h4;
                end
            4'hb: // req 1
                begin
                astate_next__var = 7'h4;
                end
            4'hc: // req 1
                begin
                astate_next__var = 7'h4;
                case (inst[11:8]) //synopsys parallel_case
                4'h0: // req 1
                    begin
                    pc_next__var = (reg__value[0]+{{{{{{{{inst[7],inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7:0]});
                    end
                4'h1: // req 1
                    begin
                    if ((reg__value[1][0]==1'h1))
                    begin
                        pc_next__var = (reg__value[0]+{{{{{{{{inst[7],inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7:0]});
                    end //if
                    end
                4'h2: // req 1
                    begin
                    if ((reg__value[1][0]==1'h0))
                    begin
                        pc_next__var = (reg__value[0]+{{{{{{{{inst[7],inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7:0]});
                    end //if
                    end
                4'h3: // req 1
                    begin
                    if ((reg__value[1][1]==1'h1))
                    begin
                        pc_next__var = (reg__value[0]+{{{{{{{{inst[7],inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7:0]});
                    end //if
                    end
                4'h4: // req 1
                    begin
                    if ((reg__value[1][1]==1'h0))
                    begin
                        pc_next__var = (reg__value[0]+{{{{{{{{inst[7],inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7:0]});
                    end //if
                    end
                4'h5: // req 1
                    begin
                    if ((reg__value[1][2]==1'h1))
                    begin
                        pc_next__var = (reg__value[0]+{{{{{{{{inst[7],inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7:0]});
                    end //if
                    end
                4'h6: // req 1
                    begin
                    if ((reg__value[1][2]==1'h0))
                    begin
                        pc_next__var = (reg__value[0]+{{{{{{{{inst[7],inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7:0]});
                    end //if
                    end
                4'h7: // req 1
                    begin
                    if ((reg__value[1][3]==1'h1))
                    begin
                        pc_next__var = (reg__value[0]+{{{{{{{{inst[7],inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7:0]});
                    end //if
                    end
                4'h8: // req 1
                    begin
                    if ((reg__value[1][3]==1'h0))
                    begin
                        pc_next__var = (reg__value[0]+{{{{{{{{inst[7],inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7:0]});
                    end //if
                    end
                4'h9: // req 1
                    begin
                    tbit__var = (reg__value[1][2] ^ reg__value[1][3]);
                    if ((tbit__var==1'h0))
                    begin
                        pc_next__var = (reg__value[0]+{{{{{{{{inst[7],inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7:0]});
                    end //if
                    end
                4'ha: // req 1
                    begin
                    tbit__var = (reg__value[1][2] ^ reg__value[1][3]);
                    if ((tbit__var==1'h1))
                    begin
                        pc_next__var = (reg__value[0]+{{{{{{{{inst[7],inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7]},inst[7:0]});
                    end //if
                    end
                default: // req 1
                    begin
                    astate_next__var = 7'h40;
                    end
                endcase
                end
            4'hd: // req 1
                begin
                astate_next__var = 7'h4;
                case (inst[11:8]) //synopsys parallel_case
                4'h0: // req 1
                    begin
                    pc_next__var = reg__value[inst[3:0]];
                    end
                4'h1: // req 1
                    begin
                    if ((reg__value[1][0]==1'h1))
                    begin
                        pc_next__var = reg__value[inst[3:0]];
                    end //if
                    end
                4'h2: // req 1
                    begin
                    if ((reg__value[1][0]==1'h0))
                    begin
                        pc_next__var = reg__value[inst[3:0]];
                    end //if
                    end
                4'h3: // req 1
                    begin
                    if ((reg__value[1][1]==1'h1))
                    begin
                        pc_next__var = reg__value[inst[3:0]];
                    end //if
                    end
                4'h4: // req 1
                    begin
                    if ((reg__value[1][1]==1'h0))
                    begin
                        pc_next__var = reg__value[inst[3:0]];
                    end //if
                    end
                4'h5: // req 1
                    begin
                    if ((reg__value[1][2]==1'h1))
                    begin
                        pc_next__var = reg__value[inst[3:0]];
                    end //if
                    end
                4'h6: // req 1
                    begin
                    if ((reg__value[1][2]==1'h0))
                    begin
                        pc_next__var = reg__value[inst[3:0]];
                    end //if
                    end
                4'h7: // req 1
                    begin
                    if ((reg__value[1][3]==1'h1))
                    begin
                        pc_next__var = reg__value[inst[3:0]];
                    end //if
                    end
                4'h8: // req 1
                    begin
                    if ((reg__value[1][3]==1'h0))
                    begin
                        pc_next__var = reg__value[inst[3:0]];
                    end //if
                    end
                4'h9: // req 1
                    begin
                    if (((reg__value[1][1]==1'h1)&&(reg__value[1][0]==1'h0)))
                    begin
                        pc_next__var = reg__value[inst[3:0]];
                    end //if
                    end
                4'ha: // req 1
                    begin
                    tbit__var = (reg__value[1][2] ^ reg__value[1][3]);
                    if ((tbit__var==1'h0))
                    begin
                        pc_next__var = reg__value[inst[3:0]];
                    end //if
                    end
                4'hb: // req 1
                    begin
                    tbit__var = (reg__value[1][2] ^ reg__value[1][3]);
                    if ((tbit__var==1'h1))
                    begin
                        pc_next__var = reg__value[inst[3:0]];
                    end //if
                    end
                4'hf: // req 1
                    begin
                    pc_next__var = reg__value[inst[3:0]];
                    end
                default: // req 1
                    begin
                    astate_next__var = 7'h40;
                    end
                endcase
                end
            default: // req 1
                begin
                astate_next__var = 7'h40;
                end
            endcase
            end
        7'h10: // req 1
            begin
            astate_next__var = 7'h4;
            end
        7'h20: // req 1
            begin
            astate_next__var = 7'h4;
            case (inst[15:12]) //synopsys parallel_case
            4'h0: // req 1
                begin
                end
            4'h1: // req 1
                begin
                end
            4'h4: // req 1
                begin
                case (inst[3:0]) //synopsys parallel_case
                4'h0: // req 1
                    begin
                    end
                4'h1: // req 1
                    begin
                    end
                4'h2: // req 1
                    begin
                    end
                4'h3: // req 1
                    begin
                    end
                4'h4: // req 1
                    begin
                    end
                default: // req 1
                    begin
                    astate_next__var = 7'h40;
                    end
                endcase
                end
            default: // req 1
                begin
                astate_next__var = 7'h40;
                end
            endcase
            end
        default: // req 1
            begin
            astate_next__var = 7'h40;
            end
        endcase
        mem_add = mem_add__var;
        mem_wdata = mem_wdata__var;
        mem_wr = mem_wr__var;
        mem_rd = mem_rd__var;
        mem_fetch = mem_fetch__var;
        astate_next = astate_next__var;
        pc_next = pc_next__var;
        tbit = tbit__var;
        shift_amt = shift_amt__var;
        op_a = op_a__var;
        op_b = op_b__var;
        op_res = op_res__var;
    end //always

    //b the_code__posedge_in_clock_active_low_in_reset clock process
    always @( posedge in_clock or negedge in_reset)
    begin : the_code__posedge_in_clock_active_low_in_reset__code
        if (in_reset==1'b0)
        begin
            inst <= 16'h0;
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
            astate <= 7'h1;
        end
        else
        begin
            case (astate) //synopsys parallel_case
            7'h1: // req 1
                begin
                end
            7'h2: // req 1
                begin
                end
            7'h4: // req 1
                begin
                inst <= mem_rdata;
                end
            7'h8: // req 1
                begin
                case (inst[15:12]) //synopsys parallel_case
                4'h0: // req 1
                    begin
                    end
                4'h1: // req 1
                    begin
                    end
                4'h2: // req 1
                    begin
                    end
                4'h3: // req 1
                    begin
                    end
                4'h4: // req 1
                    begin
                    case (inst[3:0]) //synopsys parallel_case
                    4'h0: // req 1
                        begin
                        end
                    4'h1: // req 1
                        begin
                        reg__value[inst[7:4]] <= (reg__value[inst[7:4]]+16'h1);
                        end
                    4'h2: // req 1
                        begin
                        reg__value[inst[7:4]] <= (reg__value[inst[7:4]]+16'h1);
                        end
                    4'h3: // req 1
                        begin
                        reg__value[inst[7:4]] <= (reg__value[inst[7:4]]-16'h1);
                        end
                    4'h4: // req 1
                        begin
                        reg__value[inst[7:4]] <= (reg__value[inst[7:4]]-16'h1);
                        end
                    4'h6: // req 1
                        begin
                        reg__value[inst[11:8]] <= reg__value[inst[7:4]];
                        end
                    4'h8: // req 1
                        begin
                        end
                    4'h9: // req 1
                        begin
                        reg__value[inst[11:8]] <= (reg__value[inst[11:8]]+16'h1);
                        end
                    4'ha: // req 1
                        begin
                        reg__value[inst[11:8]] <= (reg__value[inst[11:8]]+16'h1);
                        end
                    4'hb: // req 1
                        begin
                        reg__value[inst[11:8]] <= (reg__value[inst[11:8]]-16'h1);
                        end
                    4'hc: // req 1
                        begin
                        reg__value[inst[11:8]] <= (reg__value[inst[11:8]]-16'h1);
                        end
                    4'he: // req 1
                        begin
                        reg__value[inst[11:8]] <= reg__value[inst[7:4]];
                        reg__value[inst[7:4]] <= tword;
                        end
                    default: // req 1
                        begin
                        end
                    endcase
                    end
                4'h5: // req 1
                    begin
                    case (inst[7]) //synopsys parallel_case
                    1'h0: // req 1
                        begin
                        reg__value[inst[11:8]] <= reg__value[inst[3:0]];
                        end
                    default: // req 1
                        begin
                        reg__value[inst[3:0]] <= reg__value[inst[11:8]];
                        end
                    endcase
                    end
                4'h6: // req 1
                    begin
                    case (inst[3:0]) //synopsys parallel_case
                    4'h0: // req 1
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
                    4'h1: // req 1
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
                    4'h2: // req 1
                        begin
                        reg__value[1][1] <= 1'h0;
                        reg__value[1][2] <= op_res[15];
                        if ((op_res[15:0]==16'h0))
                        begin
                            reg__value[1][0] <= 1'h1;
                        end //if
                        else
                        begin
                            reg__value[1][0] <= 1'h0;
                        end //else
                        reg__value[1][3] <= 1'h0;
                        reg__value[inst[11:8]] <= op_res[15:0];
                        end
                    4'h3: // req 1
                        begin
                        reg__value[1][1] <= 1'h0;
                        reg__value[1][2] <= op_res[15];
                        if ((op_res[15:0]==16'h0))
                        begin
                            reg__value[1][0] <= 1'h1;
                        end //if
                        else
                        begin
                            reg__value[1][0] <= 1'h0;
                        end //else
                        reg__value[1][3] <= 1'h0;
                        reg__value[inst[11:8]] <= op_res[15:0];
                        end
                    4'h4: // req 1
                        begin
                        reg__value[1][1] <= 1'h0;
                        reg__value[1][2] <= op_res[15];
                        if ((op_res[15:0]==16'h0))
                        begin
                            reg__value[1][0] <= 1'h1;
                        end //if
                        else
                        begin
                            reg__value[1][0] <= 1'h0;
                        end //else
                        reg__value[1][3] <= 1'h0;
                        reg__value[inst[11:8]] <= op_res[15:0];
                        end
                    4'h5: // req 1
                        begin
                        reg__value[1][1] <= 1'h0;
                        reg__value[1][2] <= op_res[15];
                        if ((op_res[15:0]==16'h0))
                        begin
                            reg__value[1][0] <= 1'h1;
                        end //if
                        else
                        begin
                            reg__value[1][0] <= 1'h0;
                        end //else
                        reg__value[1][3] <= 1'h0;
                        reg__value[inst[11:8]] <= op_res[15:0];
                        end
                    4'h6: // req 1
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
                    4'h7: // req 1
                        begin
                        reg__value[1][1] <= 1'h0;
                        reg__value[1][2] <= op_res[15];
                        if ((op_res[15:0]==16'h0))
                        begin
                            reg__value[1][0] <= 1'h1;
                        end //if
                        else
                        begin
                            reg__value[1][0] <= 1'h0;
                        end //else
                        reg__value[1][3] <= 1'h0;
                        reg__value[inst[11:8]] <= op_res[15:0];
                        end
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
                    4'ha: // req 1
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
                        end
                    4'hb: // req 1
                        begin
                        reg__value[1][1] <= 1'h0;
                        reg__value[1][2] <= op_res[15];
                        if ((op_res[15:0]==16'h0))
                        begin
                            reg__value[1][0] <= 1'h1;
                        end //if
                        else
                        begin
                            reg__value[1][0] <= 1'h0;
                        end //else
                        reg__value[1][3] <= 1'h0;
                        end
                    default: // req 1
                        begin
                        end
                    endcase
                    end
                4'h7: // req 1
                    begin
                    case (inst[2:0]) //synopsys parallel_case
                    3'h0: // req 1
                        begin
                        reg__value[1][1] <= 1'h0;
                        reg__value[1][2] <= op_res[15];
                        if ((op_res[15:0]==16'h0))
                        begin
                            reg__value[1][0] <= 1'h1;
                        end //if
                        else
                        begin
                            reg__value[1][0] <= 1'h0;
                        end //else
                        reg__value[1][3] <= 1'h0;
                        reg__value[inst[11:8]] <= op_res[15:0];
                        end
                    3'h1: // req 1
                        begin
                        reg__value[1][1] <= 1'h0;
                        reg__value[1][2] <= op_res[15];
                        if ((op_res[15:0]==16'h0))
                        begin
                            reg__value[1][0] <= 1'h1;
                        end //if
                        else
                        begin
                            reg__value[1][0] <= 1'h0;
                        end //else
                        reg__value[1][3] <= 1'h0;
                        reg__value[inst[11:8]] <= op_res[15:0];
                        end
                    3'h2: // req 1
                        begin
                        reg__value[1][1] <= 1'h0;
                        reg__value[1][2] <= op_res[15];
                        if ((op_res[15:0]==16'h0))
                        begin
                            reg__value[1][0] <= 1'h1;
                        end //if
                        else
                        begin
                            reg__value[1][0] <= 1'h0;
                        end //else
                        reg__value[1][3] <= 1'h0;
                        reg__value[inst[11:8]] <= op_res[15:0];
                        end
                    3'h3: // req 1
                        begin
                        reg__value[1][1] <= 1'h0;
                        reg__value[1][2] <= op_res[15];
                        if ((op_res[15:0]==16'h0))
                        begin
                            reg__value[1][0] <= 1'h1;
                        end //if
                        else
                        begin
                            reg__value[1][0] <= 1'h0;
                        end //else
                        reg__value[1][3] <= 1'h0;
                        reg__value[inst[11:8]] <= op_res[15:0];
                        end
                    3'h4: // req 1
                        begin
                        reg__value[1][1] <= 1'h0;
                        reg__value[1][2] <= op_res[15];
                        if ((op_res[15:0]==16'h0))
                        begin
                            reg__value[1][0] <= 1'h1;
                        end //if
                        else
                        begin
                            reg__value[1][0] <= 1'h0;
                        end //else
                        reg__value[1][3] <= 1'h0;
                        reg__value[inst[11:8]] <= op_res[15:0];
                        end
                    3'h5: // req 1
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
                        reg__value[1][3] <= 1'h0;
                        reg__value[inst[11:8]] <= op_res[15:0];
                        end
                    3'h6: // req 1
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
                        reg__value[1][3] <= 1'h0;
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
                4'hc: // req 1
                    begin
                    end
                4'hd: // req 1
                    begin
                    case (inst[11:8]) //synopsys parallel_case
                    4'h0: // req 1
                        begin
                        end
                    4'h1: // req 1
                        begin
                        end
                    4'h2: // req 1
                        begin
                        end
                    4'h3: // req 1
                        begin
                        end
                    4'h4: // req 1
                        begin
                        end
                    4'h5: // req 1
                        begin
                        end
                    4'h6: // req 1
                        begin
                        end
                    4'h7: // req 1
                        begin
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
                        reg__value[inst[7:4]] <= reg__value[0];
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
            7'h10: // req 1
                begin
                end
            7'h20: // req 1
                begin
                case (inst[15:12]) //synopsys parallel_case
                4'h0: // req 1
                    begin
                    reg__value[inst[11:8]] <= mem_rdata;
                    end
                4'h1: // req 1
                    begin
                    reg__value[inst[11:8]] <= mem_rdata;
                    end
                4'h4: // req 1
                    begin
                    case (inst[3:0]) //synopsys parallel_case
                    4'h0: // req 1
                        begin
                        reg__value[inst[11:8]] <= mem_rdata;
                        end
                    4'h1: // req 1
                        begin
                        reg__value[inst[11:8]] <= mem_rdata;
                        end
                    4'h2: // req 1
                        begin
                        reg__value[inst[11:8]] <= mem_rdata;
                        end
                    4'h3: // req 1
                        begin
                        reg__value[inst[11:8]] <= mem_rdata;
                        end
                    4'h4: // req 1
                        begin
                        reg__value[inst[11:8]] <= mem_rdata;
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
            default: // req 1
                begin
                end
            endcase
            reg__value[0] <= pc_next;
            astate <= astate_next;
        end //if
    end //always

endmodule // lsa_core
