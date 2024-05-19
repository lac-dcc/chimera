// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    MU中的重叠态访存（包括d-cache指令）
    Upd at 6.29: 修改回退队列，因为引入sdc1后，增加了“一条指令对应两个表项”的情况
        那么应该令最后一条store的微指令在ROB中标记done（而不是第一条）
        在commit时，可以连续pop出两个表项（哦其实这个不用管，本来就可以）
*/

module mem_ctrl(
    input           clk,
    input           resetn,
    //ar
    output[3:0]     arid,
    output[31:0]    araddr,
    output[3:0]     arlen,
    output[2:0]     arsize,
    output[1:0]     arburst,
    output[1:0]     arlock,
    output[3:0]     arcache,
    output[2:0]     arprot,
    output          arvalid,
    input           arready,
    //r
    input[3:0]      rid,
    input[31:0]     rdata,
    input[1:0]      rresp,
    input           rlast,
    input           rvalid,
    output          rready,
    //aw
    output[3:0]     awid,
    output[31:0]    awaddr,
    output[3:0]     awlen,
    output[2:0]     awsize,
    output[1:0]     awburst,
    output[1:0]     awlock,
    output[3:0]     awcache,
    output[2:0]     awprot,
    output          awvalid,
    input           awready,
    //w
    output[3:0]     wid,
    output[31:0]    wdata,
    output[3:0]     wstrb,
    output          wlast,
    output          wvalid,
    input           wready,
    //b
    input[3:0]      bid,
    input[1:0]      bresp,
    input           bvalid,
    output          bready,
    //来自Commit
    input           flush,
    input           commit_en0,     //第0路Commit使能（无论Commit什么指令）
    input[$clog2(`ROB_SIZE) - 1:0]  commit_num0,    //第0路Commit的ROB编号
    input           commit_en1,     //第1路Commit使能
    input[$clog2(`ROB_SIZE) - 1:0]  commit_num1,    //第1路Commit的ROB编号
    //反馈信号
    output          busy,
    output          handling_cache,
    output[$clog2(`DCache_index_SIZE) - 1:0]    missindex,  //用于将与重叠态撞index的操作阻塞在preMEM
    //操作输入（miss的load/store，uncached的load/store，已经选好路的cache维护）
    //对于store，需要等待commit，之后就不用输出了
    //对于load，若中途flush，之后就不需要输出了
    input           req_valid,
    input[31:0]     req_paddr,
    input[2:0]      req_sel,    //miss和dcache维护共用
    input           req_dirty,  //用于写回cache块（若d-cache且非wb，则置0）
    input[4:0]      req_op,     //0: miss load, 1: miss store, 2: uncached load, 3: uncached store, 4: cache clear
    input[31:0]     req_store_data, //这个也可以配合lwl/lwr
    input[3:0]      req_store_wstrb,
    input[$clog2(`CNT_MUOP) - 1:0] req_muop,
    input[$clog2(`ROB_SIZE) - 1:0]  req_destnum,
    input[2:0]      req_rsize,
    input[19:0]     req_oldtag, //用于写回脏块
    input           req_tofpu,
    input           req_tofpu_notlast,
    //输出（仅对于load，wen一定为1）
    output          output_en,  //优先于MEM段
    output[31:0]    output_result,
    output[$clog2(`ROB_SIZE) - 1:0]   output_num,
    output          output_uncached,
    output          output_tofpu,
    output          output_tofpu_notlast,
    //回退队列接口（由自己内部维护）
    output          que_full,
    input           que_push_en,
    input[31:0]     que_push_data,
    input[9:0]      que_push_addr,
    input[$clog2(`ROB_SIZE) - 1:0]  que_push_num,
    input[2:0]      que_push_sel,
    //数据BRAM接口（加载cache/读写回cache块）
    output[9:0]     icache_data_addr,
    output          icache_data_en,   //注意：这个接口需要通过en与MEM竞争BRAM的同一个端口，具有高优先级
    output[2:0]     icache_data_sel,
    output          icache_data_wen,
    output[31:0]    icache_data_wdata,
    input[31:0]     icache_data_rdata,
    //数据BRAM接口1，专门用于恢复
    output[9:0]     back_data_addr,
    output          back_data_wen,
    output[2:0]     back_data_sel,
    output[31:0]    back_data_wdata,
    //Cache元数据修改接口
    output[$clog2(`DCache_index_SIZE) - 1:0]    info_waddr,
    output[2:0]     info_sel,
    output          info_tag_wen,
    output          info_lru_wen,
    output          info_dirty_wen,
    output          info_valid_wen,
    output[19:0]    info_tag_wdata,
    output          info_valid_wdata,
    output          info_dirty_wdata,
    //ROB队头
    input[$clog2(`ROB_SIZE) - 2:0]  rob_head,
    input                           rob_head_valid0,
    input                           rob_head_valid1
    );

    //回退队列
    reg[4:0] que_valid;
    reg[31:0] que_data[0:4];
    reg[9:0] que_addr[0:4];
    reg[2:0] que_sel[0:4];
    reg[$clog2(`ROB_SIZE) - 1:0] que_num[0:4];
    assign que_full=(que_valid == 5'b01111) | (que_valid == 5'b10111) | (que_valid == 5'b11011) |
        (que_valid == 5'b11101) | (que_valid == 5'b11110);
    wire[4:0] que_tail,que_rev_head;
    wire[31:0] que_head_data=(|que_rev_head[2:0]) ? (que_rev_head[0] ? que_data[0] : (que_rev_head[1] ? que_data[1] : que_data[2])) :
        (que_rev_head[3] ? que_data[3] : que_data[4]);
    wire[9:0] que_head_addr=(|que_rev_head[2:0]) ? (que_rev_head[0] ? que_addr[0] : (que_rev_head[1] ? que_addr[1] : que_addr[2])) :
        (que_rev_head[3] ? que_addr[3] : que_addr[4]);
    wire[3:0] que_head_sel=(|que_rev_head[2:0]) ? (que_rev_head[0] ? que_sel[0] : (que_rev_head[1] ? que_sel[1] : que_sel[2])) :
        (que_rev_head[3] ? que_sel[3] : que_sel[4]);
    reg isbacking;          //是否正在执行回退

    always@(posedge clk)
        if(~resetn)
            isbacking<=0;
        else if(flush | ~(|que_valid))
            isbacking<=flush;
    
    genvar i;
    generate
        for(i=0; i < 5; i=i + 1) begin
            assign que_tail[i]=((~que_valid[i]) & ((i == 0) ? que_valid[4] : que_valid[i - 1])) | ((i == 0) & ~(|que_valid));
            assign que_rev_head[i]=que_valid[i] & ~((i == 4) ? que_valid[0] : que_valid[i + 1]);
            always@(posedge clk) begin
                if(~resetn) begin
                    que_valid[i]<=0;
                    que_data[i]<=0;
                    que_addr[i]<=0;
                    que_sel[i]<=0;
                    que_num[i]<=0;
                end
                else begin
                    if((que_rev_head[i] & isbacking) | ((commit_en0 & (commit_num0 == que_num[i])) | (commit_en1 & (commit_num1 == que_num[i]))) | (que_tail[i] & que_push_en))
                        que_valid[i]<=que_tail[i] & que_push_en;
                    if(que_tail[i] & que_push_en) begin
                        que_data[i]<=que_push_data;
                        que_addr[i]<=que_push_addr;
                        que_sel[i]<=que_push_sel;
                        que_num[i]<=que_push_num;
                    end
                end
            end
        end
    endgenerate

    //回退
    assign back_data_addr=que_head_addr;
    assign back_data_sel=que_head_sel;
    assign back_data_wdata=que_head_data;
    assign back_data_wen=isbacking & |que_valid;
    
    //缓存操作
    reg           overlay_valid;
    reg[31:0]     overlay_paddr;
    reg[2:0]      overlay_sel;    //miss和dcache维护共用
    reg           overlay_dirty;  //用于写回cache块
    reg[4:0]      overlay_op;     //0: miss load, 1: miss store, 2: uncached load, 3: uncached store, 4: cache clear
    reg[31:0]     overlay_store_data; //这个也可以配合lwl/lwr
    reg[3:0]      overlay_store_wstrb;
    reg[19:0]     overlay_oldtag;
    reg[2:0]      overlay_rsize;
    reg[$clog2(`CNT_MUOP) - 1:0] overlay_muop;
    reg[$clog2(`ROB_SIZE) - 1:0] overlay_destnum;
    reg overlay_tofpu;
    reg overlay_tofpu_notlast;

    reg[2:0] overlay_state;
    reg[31:0] overlay_catchdata;    //用于load数据捕获
    reg[$clog2(`DCache_block_WORDS) - 1:0] overlay_wptr;
    reg[$clog2(`DCache_block_WORDS) - 1:0] overlay_pre_wptr;
    reg[$clog2(`DCache_block_WORDS) - 1:0] overlay_rptr;
    reg overlay_iscatched;
    reg overlay_wen;                //对于load，当wen且iscatched时，输出。若中途flush，则将其置0

    wire[4:0] que_conflict; //判断回退队列是否撞overlay的操作index
    generate
        for(i=0; i < 5; i=i + 1) begin
            assign que_conflict[i]=que_valid[i] & (que_addr[i][9:$clog2(`DCache_block_WORDS)] == overlay_paddr[11:(12 - $clog2(`DCache_index_SIZE))]);
        end
    endgenerate

    reg rh_valid0,rh_valid1;
    reg[$clog2(`ROB_SIZE) - 2:0] rh_head;
    reg[$clog2(`ROB_SIZE) - 1:0] real_rob_head;
    reg real_rob_valid;
    always@(posedge clk) begin
        if(~resetn) begin
            rh_valid0<=0;
            rh_valid1<=0;
            rh_head<=0;
            real_rob_valid<=0;
            real_rob_head<=0;
        end
        else begin
            if(flush) begin
                rh_valid0<=0;
                rh_valid1<=0;
                real_rob_valid<=0;
            end
            else begin
                rh_valid0<=rob_head_valid0;
                rh_valid1<=rob_head_valid1;
                real_rob_valid<=rh_valid0 | rh_valid1;
            end
            rh_head<=rob_head;
            real_rob_head<={(rh_valid1 & ~rh_valid0),rh_head};
        end
    end

    wire commitself=(commit_en0 & (commit_num0 == overlay_destnum)) | (commit_en1 & (commit_num1 == overlay_destnum));

    always@(posedge clk) begin
        if(~resetn) begin
            overlay_state<=0;
            overlay_wptr<=0;
            overlay_pre_wptr<=0;
            overlay_rptr<=0;
            overlay_catchdata<=0;
            overlay_iscatched<=0;
            overlay_wen<=0;
        end
        else begin
            if(overlay_state == 5)
                overlay_rptr<=0;
            else if(rvalid & rready)
                overlay_rptr<=overlay_rptr + 1;
            if(overlay_state == 3) begin
                overlay_wptr<=0;
                overlay_pre_wptr<=1;
            end
            else if(wvalid & wready) begin
                overlay_wptr<=overlay_wptr + 1;
                overlay_pre_wptr<=overlay_pre_wptr + 1;
            end
            else if(overlay_state == 0)
                overlay_pre_wptr<=0;
            if((rvalid & rready) & (overlay_op[2] | (overlay_rptr == overlay_paddr[$clog2(`DCache_block_WORDS) + 1:2])))
                overlay_catchdata<=rdata;
            if(req_valid | ((rvalid & rready) & (overlay_op[2] | (overlay_rptr == overlay_paddr[$clog2(`DCache_block_WORDS) + 1:2]))))
                overlay_iscatched<=~req_valid;
            if(flush | req_valid | (overlay_wen & overlay_iscatched))
                overlay_wen<=req_valid & (req_op[0] | req_op[2]);
            case(overlay_state)
            0:  overlay_state<=(req_valid & ~flush) ? (req_op[0] ? 2 : 1) : 0;
            //Note: 原来我们仅让uncached load等待“队头”，现在干脆取消这个限制，让store也能这么干
            1:  overlay_state<=(flush & ~commitself) ? 0 : ((commitself | (/*overlay_op[2] &*/ real_rob_valid & (real_rob_head == overlay_destnum))) ?
                ((overlay_dirty | overlay_op[3]) ? 3 : (overlay_op[4] ? 7 : 5)) : 1);
            2:  overlay_state<=flush ? 0 : ((overlay_dirty & |que_conflict) ? 2 : (overlay_dirty ? 3 : 5));
            3:  overlay_state<=awready ? 4 : 3;
            4:  overlay_state<=(wready & wlast) ? (overlay_op[3] ? 0 : (overlay_op[4] ? 7 : 5)) : 4;
            5:  overlay_state<=arready ? 6 : 5;
            6:  overlay_state<=(rvalid & rlast) ? (overlay_op[2] ? 0 : 7) : 6;
            7:  overlay_state<=0;
            default:;
            endcase
        end
    end

    assign awsize=2;
    assign awid=1;
    assign awburst=2'b01;
    assign awlock=0;
    assign awcache=0;
    assign awprot=0;
    assign bready=1;
    assign wid=1;
    assign arid=1;
    assign arsize=overlay_op[2] ? overlay_rsize : 2;
    assign arburst=2'b01;
    assign arlock=0;
    assign arcache=0;
    assign arprot=0;

    assign awvalid=(overlay_state == 3);
    assign arvalid=(overlay_state == 5);
    assign rready=(overlay_state == 6);
    assign wvalid=(overlay_state == 4);
    assign araddr=overlay_op[2] ? /*{*/overlay_paddr/*[31:2],2'b0}*/ : {overlay_paddr[31:($clog2(`DCache_block_WORDS) + 2)],{$clog2(`DCache_block_WORDS){1'b0}},2'b0};
    assign awaddr=overlay_op[3] ? /*{*/overlay_paddr/*[31:2],2'b0}*/ : {overlay_oldtag,overlay_paddr[11:($clog2(`DCache_block_WORDS) + 2)],{$clog2(`DCache_block_WORDS){1'b0}},2'b0};
    assign arlen=overlay_op[2] ? 0 : (`DCache_block_WORDS - 1);
    assign awlen=overlay_op[3] ? 0 : (`DCache_block_WORDS - 1);
    assign wstrb=overlay_op[3] ? overlay_store_wstrb : 4'b1111;
    assign wdata=overlay_op[3] ? overlay_store_data : icache_data_rdata;
    assign wlast=wvalid & (overlay_op[3] | (overlay_wptr == `DCache_block_WORDS - 1));

    assign icache_data_addr={overlay_paddr[11:(12 - $clog2(`DCache_index_SIZE))],
        (overlay_state == 6) ? overlay_rptr : ((wvalid & ~wready) ? overlay_wptr : overlay_pre_wptr)};
    assign icache_data_en=(awvalid & awready & ~overlay_op[3]) | wvalid | (rvalid & rready & ~overlay_op[2]);
    assign icache_data_sel=overlay_sel;
    assign icache_data_wen=rvalid & rready & ~overlay_op[2];
    assign icache_data_wdata=(overlay_op[1] & (overlay_rptr == overlay_paddr[$clog2(`DCache_block_WORDS) + 1:2])) ? 
        {overlay_store_wstrb[3] ? overlay_store_data[31:24] : rdata[31:24],
        overlay_store_wstrb[2] ? overlay_store_data[23:16] : rdata[23:16],
        overlay_store_wstrb[1] ? overlay_store_data[15:8] : rdata[15:8],
        overlay_store_wstrb[0] ? overlay_store_data[7:0] : rdata[7:0]} : rdata;

    assign busy=overlay_valid;
    assign handling_cache=overlay_valid & ~(overlay_op[2] | overlay_op[3]);
    assign missindex=overlay_paddr[11:(12 - $clog2(`DCache_index_SIZE))];
    
    assign info_waddr=overlay_paddr[11:(12 - $clog2(`DCache_index_SIZE))];
    assign info_sel=overlay_sel;
    assign info_tag_wen=(overlay_state == 7);
    assign info_tag_wdata=overlay_paddr[31:12];
    assign info_lru_wen=(overlay_state == 7);
    assign info_valid_wen=(overlay_state == 7);
    assign info_dirty_wen=(overlay_state == 7);
    assign info_dirty_wdata=overlay_op[1];
    assign info_valid_wdata=~overlay_op[4];

    reg[31:0] calcresult;
    assign output_en=overlay_wen & overlay_iscatched;
    assign output_result=calcresult;
    assign output_num=overlay_destnum;
    assign output_uncached=overlay_op[2];
    assign output_tofpu=overlay_tofpu;
    assign output_tofpu_notlast=overlay_tofpu_notlast;
    reg[31:0] lb_result;
    reg[31:0] lbu_result;
    reg[31:0] lwl_result;
    reg[31:0] lwr_result;

    always@(*) begin
        case(overlay_paddr[1:0])
        2'b00: begin
            lb_result={{24{overlay_catchdata[7]}},overlay_catchdata[7:0]};
            lbu_result={24'b0,overlay_catchdata[7:0]};
            lwl_result={overlay_catchdata[7:0],overlay_store_data[23:0]};
            lwr_result=overlay_catchdata;
        end
        2'b01: begin
            lb_result={{24{overlay_catchdata[15]}},overlay_catchdata[15:8]};
            lbu_result={24'b0,overlay_catchdata[15:8]};
            lwl_result={overlay_catchdata[15:0],overlay_store_data[15:0]};
            lwr_result={overlay_store_data[31:24],overlay_catchdata[31:8]};
        end
        2'b10: begin
            lb_result={{24{overlay_catchdata[23]}},overlay_catchdata[23:16]};
            lbu_result={24'b0,overlay_catchdata[23:16]};
            lwl_result={overlay_catchdata[23:0],overlay_store_data[7:0]};
            lwr_result={overlay_store_data[31:16],overlay_catchdata[31:16]};
        end
        2'b11: begin
            lb_result={{24{overlay_catchdata[31]}},overlay_catchdata[31:24]};
            lbu_result={24'b0,overlay_catchdata[31:24]};
            lwl_result=overlay_catchdata;
            lwr_result={overlay_store_data[31:8],overlay_catchdata[31:24]};
        end
        default:;
        endcase
        case(overlay_muop)
        `MUOP_lb:   calcresult=lb_result;
        `MUOP_lbu:  calcresult=lbu_result;
        `MUOP_lh:   calcresult=overlay_paddr[1] ? {{16{overlay_catchdata[31]}},overlay_catchdata[31:16]} : {{16{overlay_catchdata[15]}},overlay_catchdata[15:0]};
        `MUOP_lhu:  calcresult=overlay_paddr[1] ? {16'b0,overlay_catchdata[31:16]} : {16'b0,overlay_catchdata[15:0]};
        `MUOP_lw:   calcresult=overlay_catchdata;
        `MUOP_lwl:  calcresult=lwl_result;
        `MUOP_lwr:  calcresult=lwr_result;
        default:    calcresult=0;
        endcase
    end

    always@(posedge clk) begin
        if(~resetn) begin
            overlay_valid<=0;
            overlay_paddr<=0;
            overlay_sel<=0;
            overlay_dirty<=0;
            overlay_op<=0;
            overlay_store_data<=0;
            overlay_store_wstrb<=0;
            overlay_oldtag<=0;
            overlay_destnum<=0;
            overlay_muop<=0;
            overlay_rsize<=0;
            overlay_tofpu<=0;
            overlay_tofpu_notlast<=0;
        end
        else begin
            if(req_valid & ~overlay_valid) begin
                overlay_paddr<=req_paddr;
                overlay_sel<=req_sel;
                overlay_dirty<=req_dirty;
                overlay_op<=req_op;
                overlay_store_data<=req_store_data;
                overlay_store_wstrb<=req_store_wstrb;
                overlay_oldtag<=req_oldtag;
                overlay_destnum<=req_destnum;
                overlay_muop<=req_muop;
                overlay_rsize<=req_rsize;
                overlay_tofpu<=req_tofpu;
                overlay_tofpu_notlast<=req_tofpu_notlast;
            end
            if((req_valid & ~overlay_valid) | (flush & ((overlay_state == 0) | ((overlay_state == 1) & ~commitself) | (overlay_state == 2))) |
                (overlay_state == 7) | (wlast & wready & overlay_op[3]) | (rvalid & rlast & overlay_op[2]))
                overlay_valid<=req_valid & (~flush) & ~overlay_valid;
        end
    end

endmodule