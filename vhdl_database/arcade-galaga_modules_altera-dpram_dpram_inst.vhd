dpram_inst : entity work.dpram
    generic map (
        addr_width_g => addr_width_g,
        data_width_g => data_width_g
    )
    port map (
        clock_a   => clock_a,
        wren_a    => wren_a,
        address_a => address_a,
        data_a    => data_a,

        clock_b   => clock_b,
        address_b => address_b,
        q_b       => q_b

        -- data_b    => data_b,
        -- enable_a  => enable_a,
        -- enable_b  => enable_b,
        -- wren_b    => wren_b,
        -- q_a       => q_a,
    );
