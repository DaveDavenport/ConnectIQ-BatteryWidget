using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.Lang as Lang;

class BatteryWidgetView extends Ui.View {

    //! Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    // Set of colors.
	var colorsteps = [
		0xAA0000, //  0 - 10
		0xFF0000, // 10 - 20
		0xFF5500, // 20 - 30
		0xFFAA00, // 30 - 40
		0x00AA00, // 40 - 50
		0x00AA00, // 50 - 60
		0x00FF00, // 60 - 70
		0x00FF00, // 70 - 80
		0x00FF00, // 80 - 90
		0x00FF00  // 90 - 100
	];

    //! Update the view
    function onUpdate(dc) {
    
    	var stat = Sys.getSystemStats();
    	var bats = 100;//stat.battery;
		var bstatestr = bats.format("%.0f")+"%";
		
		
		// Update battery label.
    	findDrawableById("BatteryState").setText(bstatestr);
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        
       	// Draw battery.
        var pb = new Rez.Drawables.Battery();        
        pb.draw(dc);
        
        for ( var iter = 0; iter < bats ; iter+=10) { 
        	var width = 10;
        	if ( (bats-iter) < 10 ) {
        		width = (bats-iter);
        	}
            var color = colorsteps[iter/10];
			dc.setColor(color,color,color);
			dc.fillRoundedRectangle(36+iter*1.38,103, width, 34, 3);
		}
       
    }

    //! Called when this View is removed from the screen. Save the
    //! state of your app here.
    function onHide() {
    }

}
