-------------------------------------------------
-- architecture a1 du compteur de gray
-- compteur de gray tout seul
-------------------------------------------------

architecture a1 of compteur_gray is

signal g : std_logic_vector (bit_size downto 0);

begin

	process(clk, reset, enable)
	begin
		if (reset <= '0') then
			g(0) <= '1';
			g(bit_size downto 1) <= (others => '0');
		elsif(rising_edge(clk) and enable = '1') then
			g(0) <= not g(0);

			g(1) <= g(1) xor g(0);

			for i in 2 to bit_size loop
				if (g(i-1) = '1' and to_integer(unsigned(g(i-2 downto 0))) = 0) then
					g(i) <= not g(i);
				end if;
				if () then -- to terminate
					reset <= '0';
				end if;
			end loop;

		end if;
	end process;

	count_out <= unsigned(g(bit_size downto 1));

end a1 ;
