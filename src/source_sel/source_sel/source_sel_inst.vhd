	component source_sel is
		port (
			clk                : in  std_logic                     := 'X';             -- clk
			reset              : in  std_logic                     := 'X';             -- reset
			src_in_credit      : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- credit
			src_in_update      : in  std_logic                     := 'X';             -- update
			src_out_ret_credit : out std_logic;                                        -- returnCredit
			src_out_channel    : out std_logic_vector(1 downto 0);                     -- channel
			src_out_data       : out std_logic_vector(63 downto 0);                    -- data
			src_out_valid      : out std_logic;                                        -- valid
			sink0_valid        : in  std_logic                     := 'X';             -- valid
			sink0_data         : in  std_logic_vector(63 downto 0) := (others => 'X'); -- data
			sink0_credit       : out std_logic_vector(0 downto 0);                     -- credit
			sink0_update       : out std_logic;                                        -- update
			sink0_ret_credit   : in  std_logic                     := 'X';             -- returnCredit
			sink1_valid        : in  std_logic                     := 'X';             -- valid
			sink1_data         : in  std_logic_vector(63 downto 0) := (others => 'X'); -- data
			sink1_credit       : out std_logic_vector(0 downto 0);                     -- credit
			sink1_update       : out std_logic;                                        -- update
			sink1_ret_credit   : in  std_logic                     := 'X';             -- returnCredit
			sink2_valid        : in  std_logic                     := 'X';             -- valid
			sink2_data         : in  std_logic_vector(63 downto 0) := (others => 'X'); -- data
			sink2_credit       : out std_logic_vector(0 downto 0);                     -- credit
			sink2_update       : out std_logic;                                        -- update
			sink2_ret_credit   : in  std_logic                     := 'X';             -- returnCredit
			sink3_valid        : in  std_logic                     := 'X';             -- valid
			sink3_data         : in  std_logic_vector(63 downto 0) := (others => 'X'); -- data
			sink3_credit       : out std_logic_vector(0 downto 0);                     -- credit
			sink3_update       : out std_logic;                                        -- update
			sink3_ret_credit   : in  std_logic                     := 'X'              -- returnCredit
		);
	end component source_sel;

	u0 : component source_sel
		port map (
			clk                => CONNECTED_TO_clk,                --       clk.clk
			reset              => CONNECTED_TO_reset,              -- clk_reset.reset
			src_in_credit      => CONNECTED_TO_src_in_credit,      --       src.credit
			src_in_update      => CONNECTED_TO_src_in_update,      --          .update
			src_out_ret_credit => CONNECTED_TO_src_out_ret_credit, --          .returnCredit
			src_out_channel    => CONNECTED_TO_src_out_channel,    --          .channel
			src_out_data       => CONNECTED_TO_src_out_data,       --          .data
			src_out_valid      => CONNECTED_TO_src_out_valid,      --          .valid
			sink0_valid        => CONNECTED_TO_sink0_valid,        --     sink0.valid
			sink0_data         => CONNECTED_TO_sink0_data,         --          .data
			sink0_credit       => CONNECTED_TO_sink0_credit,       --          .credit
			sink0_update       => CONNECTED_TO_sink0_update,       --          .update
			sink0_ret_credit   => CONNECTED_TO_sink0_ret_credit,   --          .returnCredit
			sink1_valid        => CONNECTED_TO_sink1_valid,        --     sink1.valid
			sink1_data         => CONNECTED_TO_sink1_data,         --          .data
			sink1_credit       => CONNECTED_TO_sink1_credit,       --          .credit
			sink1_update       => CONNECTED_TO_sink1_update,       --          .update
			sink1_ret_credit   => CONNECTED_TO_sink1_ret_credit,   --          .returnCredit
			sink2_valid        => CONNECTED_TO_sink2_valid,        --     sink2.valid
			sink2_data         => CONNECTED_TO_sink2_data,         --          .data
			sink2_credit       => CONNECTED_TO_sink2_credit,       --          .credit
			sink2_update       => CONNECTED_TO_sink2_update,       --          .update
			sink2_ret_credit   => CONNECTED_TO_sink2_ret_credit,   --          .returnCredit
			sink3_valid        => CONNECTED_TO_sink3_valid,        --     sink3.valid
			sink3_data         => CONNECTED_TO_sink3_data,         --          .data
			sink3_credit       => CONNECTED_TO_sink3_credit,       --          .credit
			sink3_update       => CONNECTED_TO_sink3_update,       --          .update
			sink3_ret_credit   => CONNECTED_TO_sink3_ret_credit    --          .returnCredit
		);

