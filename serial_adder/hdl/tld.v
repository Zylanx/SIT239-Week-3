module tld (
	input i_clk,
	input [2:0] i_sliders,
	input i_button,
	
	output reg [4:0] o_leds
);
	wire [4:0] w_leds;
	
	wire [2:0] w_x_data;
	wire [2:0] w_y_data;
	
	reg r_internal_reset = 1'b0;
	
	wire w_adder_load;
	wire w_led_load;
	
	wire w_carry;
	wire [2:0] w_sum;
	
	serial_adder adder (
		.i_clk(i_clk),
		.i_reset(r_internal_reset),
		.i_load(w_adder_load),
		.i_x_data(w_x_data),
		.i_y_data(w_y_data),
		.o_sum(w_sum),
		.o_carry(w_carry)
	);
	
	controller ctrl (
		.i_clk(i_clk),
		.o_adder_load(w_adder_load),
		.o_led_load(w_led_load)
	);
	
	input_controller input_ctrl (
		.i_clk(i_clk),
		.i_button(i_button),
		.i_sliders(i_sliders),
		.o_x_data(w_x_data),
		.o_y_data(w_y_data),
		.o_cur_selection(w_leds[4])
	);
	
	assign w_leds[3:0] = {w_carry, w_sum};
	
	always @(posedge i_clk) begin
		if (w_led_load) begin
			o_leds <= w_leds;
		end
	end

endmodule