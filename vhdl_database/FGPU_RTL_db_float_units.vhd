-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--library xil_defaultlib; -- necessray for synthesis
--use xil_defaultlib.all;

library fgpu;
use fgpu.definitions.all;
use fgpu.components.all;
---------------------------------------------------------------------------------------------------------}}}
entity float_units is -- {{{
port(
  float_a, float_b    : in SLV32_ARRAY(CV_SIZE-1 downto 0); -- level 9.
  fsub                : in std_logic;
  res_float           : out SLV32_ARRAY(CV_SIZE-1 downto 0); -- level 10+MAX_FPU_DELAY.
  code                : in std_logic_vector(CODE_W-1 downto 0); -- level 16.

  clk, nrst           : in std_logic
);
end entity; -- }}}
architecture Behavioral of float_units is

  -- signals definitions {{{


  signal ce : std_logic;

  signal fadd_res                         : SLV32_ARRAY(CV_SIZE-1 downto 0);
  signal fslt_res                         : SLV32_ARRAY(CV_SIZE-1 downto 0);
  signal fmul_res                         : SLV32_ARRAY(CV_SIZE-1 downto 0);
  signal fdiv_res                         : SLV32_ARRAY(CV_SIZE-1 downto 0);
  signal fsqrt_res                        : SLV32_ARRAY(CV_SIZE-1 downto 0);
  signal frsqrt_res                       : SLV32_ARRAY(CV_SIZE-1 downto 0);
  signal uitofp_res                       : SLV32_ARRAY(CV_SIZE-1 downto 0);

  type res_vec_type is array (natural range<>) of SLV32_ARRAY(CV_SIZE-1 downto 0);
  signal fmul_res_vec                     : res_vec_type(max(MAX_FPU_DELAY-FMUL_DELAY,0) downto 0);
  signal uitofp_res_vec                   : res_vec_type(max(MAX_FPU_DELAY-UITOFP_DELAY, 0) downto 0);
  signal fadd_res_vec                     : res_vec_type(max(MAX_FPU_DELAY-FADD_DELAY, 0) downto 0);
  signal fslt_res_vec                     : alu_en_vec_type(MAX_FPU_DELAY-FSLT_DELAY downto 0);
  signal code_vec                         : code_vec_type(MAX_FPU_DELAY-8 downto 0);

  -- XDC: attribute max_fanout of code_vec        : signal is 32;
  --signal fmul_valid                       : std_logic_vector(CV_SIZE-1 downto 0);
  --signal fdiv_valid                       : std_logic_vector(CV_SIZE-1 downto 0);
  --signal fsqrt_valid                      : std_logic_vector(CV_SIZE-1 downto 0);

  -- Operation slave channel signals
  signal operation_tdata                  : std_logic_vector(7 downto 0);

  --}}}
begin
  fadd_res_vec(fadd_res_vec'high) <= fadd_res; -- level 20.
  fmul_res_vec(fmul_res_vec'high) <= fmul_res; -- level 17.
  uitofp_res_vec(uitofp_res_vec'high) <= uitofp_res; -- level 14.
  fstl_vec: for i in 0 to CV_SIZE-1 generate
    fslt_res_vec(fslt_res_vec'high)(i) <= fslt_res(i)(0); -- level 11.
  end generate;


  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        ce <= '0';
      else
        ce <= '1';
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        res_float <= (others => (others => '0')); -- NOT NEEDED
      else
        case code_vec(0) is -- 9+MAX_FPU_DELAY. (37)
          when x"1" => -- fmul
            res_float <= fmul_res_vec(0); -- @ 10+MAX_FPU_DELAY.
          when x"2" => -- fdiv
            res_float <= fdiv_res; -- @ 10+MAX_FPU_DELAY.
          when x"3" => -- uitofp
            res_float <= uitofp_res_vec(0); -- @ 10+MAX_FPU_DELAY.
          when x"4" => -- fsqrt
            res_float <= fsqrt_res; -- @ 10+MAX_FPU_DELAY.
          when x"5" => -- frsqrt
            res_float <= frsqrt_res; -- @ 10+MAX_FPU_DELAY.
          when x"7" => -- fslt
            res_float <= (others => (others => '0'));
            for i in 0 to CV_SIZE-1 loop
              res_float(i)(0) <= fslt_res_vec(0)(i); -- @ 10+MAX_FPU_DELAY.
            end loop;
          when others => -- fadd x"0" or fsub x"8"
            if MAX_FPU_DELAY /= FADD_DELAY then
              res_float <= fadd_res_vec(0); -- @ 10+MAX_FPU_DELAY.
            else
              res_float <= fadd_res;
            end if;
        end case;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if MAX_FPU_DELAY /= FSLT_DELAY then
        fslt_res_vec(fslt_res_vec'high-1 downto 0) <= fslt_res_vec(fslt_res_vec'high downto 1); -- @ 11.->11+MAX_FPU_DELAY-UITOFP_DELAY-1.
      end if;

      if MAX_FPU_DELAY /= UITOFP_DELAY then
        uitofp_res_vec(uitofp_res_vec'high-1 downto 0) <= uitofp_res_vec(uitofp_res_vec'high downto 1); -- @ 15.->15+MAX_FPU_DELAY-UITOFP_DELAY-1.
      end if;

      if MAX_FPU_DELAY /= FMUL_DELAY then
        fmul_res_vec(fmul_res_vec'high-1 downto 0) <= fmul_res_vec(fmul_res_vec'high downto 1); -- @ 18.->18+MAX_FPU_DELAY-FMUL_DELAY-1.
      end if;

      if MAX_FPU_DELAY /= FADD_DELAY then
        fadd_res_vec(max(fadd_res_vec'high-1, 0) downto 0) <= fadd_res_vec(fadd_res_vec'high downto min_int(MAX_FPU_DELAY-FADD_DELAY,1)); -- @ 21.->21+MAX_FPU_DELAY-FADD_DELAY-1.
        -- min and max to avoid warning during simulations
      end if;

      code_vec <= code & code_vec(code_vec'high downto 1); -- @ 17.->17+MAX_FPU_DELAY-8-1.
    end if;
  end process;

  fp_units: for i in 0 to CV_SIZE-1 generate
  begin

    uitofp_if: if UITOFP_IMPLEMENT /= 0 generate -- {{{
      ui_to_float: uitofp
      port map (
        -- Global signals
        aclk                    => clk,
        -- AXI4-Stream slave channel for operand A
        s_axis_a_tvalid         => ce,
        s_axis_a_tdata          => float_a(i), -- level 9.
        -- AXI4-Stream master channel for output result
        m_axis_result_tvalid    => open,
        m_axis_result_tdata     => uitofp_res(i) -- level 9+5=14.
        );
    end generate; -- }}}

    fsqrt_if: if FSQRT_IMPLEMENT /= 0 generate -- {{{
      float_sqrt: fsqrt
      port map (
        -- Global signals
        aclk                    => clk,
        -- AXI4-Stream slave channel for operand A
        s_axis_a_tvalid         => ce,
        s_axis_a_tdata          => float_a(i), -- level 9.
        -- AXI4-Stream master channel for output result
        m_axis_result_tvalid    => open,
        m_axis_result_tdata     => fsqrt_res(i) -- level 9+28=37.
        );
    end generate; -- }}}

    frsqrt_if: if FRSQRT_IMPLEMENT /= 0 generate -- {{{
      float_rsqrt: frsqrt
      port map (
        -- Global signals
        aclk                    => clk,
        -- AXI4-Stream slave channel for operand A
        s_axis_a_tvalid         => ce,
        s_axis_a_tdata          => float_a(i), -- level 9.
        -- AXI4-Stream master channel for output result
        m_axis_result_tvalid    => open,
        m_axis_result_tdata     => frsqrt_res(i) -- level 9+28=37.
        );
    end generate; -- }}}

    fdiv_if: if FDIV_IMPLEMENT /= 0 generate -- {{{
      float_div: fdiv
      port map (
        -- Global signals
        aclk                    => clk,
        -- AXI4-Stream slave channel for operand A
        s_axis_a_tvalid         => ce,
        s_axis_a_tdata          => float_a(i), -- level 9.
        -- AXI4-Stream slave channel for operand B
        s_axis_b_tvalid         => ce,
        s_axis_b_tdata          => float_b(i), -- level 9.
        -- AXI4-Stream master channel for output result
        m_axis_result_tvalid    => open,
        m_axis_result_tdata     => fdiv_res(i) -- level 9+28=37.
        );
    end generate; -- }}}

    fmul_if: if FMUL_IMPLEMENT /= 0 generate -- {{{
      float_mul: fmul
      port map (
        -- Global signals
        aclk                    => clk,
        -- AXI4-Stream slave channel for operand A
        s_axis_a_tvalid         => ce,
        s_axis_a_tdata          => float_a(i), -- level 9.
        -- AXI4-Stream slave channel for operand B
        s_axis_b_tvalid         => ce,
        s_axis_b_tdata          => float_b(i), -- level 9.
        -- AXI4-Stream master channel for output result
        m_axis_result_tvalid    => open,
        m_axis_result_tdata     => fmul_res(i) -- level 9+8=17.
        );
    end generate; -- }}}

    fadd_if: if FADD_IMPLEMENT /= 0 generate -- {{{
      operation_tdata <= "0000000" & fsub;
      float_add_sub: fadd_fsub
      port map (
        -- Global signals
        aclk                    => clk,
        -- AXI4-Stream slave channel for operand A
        s_axis_a_tvalid         => ce,
        s_axis_a_tdata          => float_a(i), -- level 9.
        -- AXI4-Stream slave channel for operand B
        s_axis_b_tvalid         => ce,
        s_axis_b_tdata          => float_b(i), -- level 9.
        -- AXI4-Stream slave channel for operation control information
        s_axis_operation_tvalid => ce,
        s_axis_operation_tdata  => operation_tdata, -- level 9
        -- AXI4-Stream master channel for output result
        m_axis_result_tvalid    => open,
        m_axis_result_tdata     => fadd_res(i) -- level 9+11=20.
        );
    end generate; -- }}}

    fslt_if: if FSLT_IMPLEMENT /= 0 generate -- {{{
      float_slt: fslt
      port map (
        -- Global signals
        aclk                    => clk,
        -- AXI4-Stream slave channel for operand A
        s_axis_a_tvalid         => ce,
        s_axis_a_tdata          => float_a(i), -- level 9.
        -- AXI4-Stream slave channel for operand B
        s_axis_b_tvalid         => ce,
        s_axis_b_tdata          => float_b(i), -- level 9.
        -- AXI4-Stream master channel for output result
        m_axis_result_tvalid    => open,
        m_axis_result_tdata     => fslt_res(i)(7 downto 0) -- level 9+2=11.
        );

        fslt_res(i)(31 downto 8) <= (others => '0');
    end generate; -- }}}

  end generate;
  ---------------------------------------------------------------------------------------------------------}}}

end Behavioral;
