$(window).bind('page:change', function() {
	for (var i=0; i < $('.champions').length; i++) {
		var balanced = $('#' + $('.champions').eq(i).attr('id')).siblings('.votes').children('.btn-primary')
		var buff = $('#' + $('.champions').eq(i).attr('id')).siblings('.votes').children('.btn-success')
		var nerf = $('#' + $('.champions').eq(i).attr('id')).siblings('.votes').children('.btn-danger')
		var rework = $('#' + $('.champions').eq(i).attr('id')).siblings('.votes').children('.btn-warning')
		balanced.click(function(event){
			championname = $(this).parent('.votes').siblings('.champions').attr('id')
			$.ajax({
            url: "/votebalanced",
            data: championname,
            method: 'post',
            success: function(data){
            	$(this).children('#balancednum').html(data.name.balanced);
            	$(this).siblings('.btn-success').children('#buffnum').html(data.name.buff);
            	$(this).siblings('.btn-danger').children('#nerfnum').html(data.name.nerf);
            	$(this).siblings('.btn-warning').children('#reworknum').html(data.name.rework);
            },
            context: this
           });
		});
		buff.click(function(event){
			championname = $(this).parent('.votes').siblings('.champions').attr('id')
			$.ajax({
            url: "/votebuff",
            data: championname,
            method: 'post',
            success: function(data){
            	$(this).siblings('.btn-primary').children('#balancednum').html(data.name.balanced);
            	$(this).children('#buffnum').html(data.name.buff);
            	$(this).siblings('.btn-danger').children('#nerfnum').html(data.name.nerf);
            	$(this).siblings('.btn-warning').children('#reworknum').html(data.name.rework);
            },
            context: this
           });
		});
		nerf.click(function(event){
			championname = $(this).parent('.votes').siblings('.champions').attr('id')
			$.ajax({
            url: "/votenerf",
            data: championname,
            method: 'post',
            success: function(data){
            	$(this).siblings('.btn-primary').children('#balancednum').html(data.name.balanced)
            	$(this).siblings('.btn-success').children('#buffnum').html(data.name.buff)
            	$(this).children('#nerfnum').html(data.name.nerf)
            	$(this).siblings('.btn-warning').children('#reworknum').html(data.name.rework)
            },
            context: this
           });
		});
		rework.click(function(event){
			championname = $(this).parent('.votes').siblings('.champions').attr('id')
			$.ajax({
            url: "/voterework",
            data: championname,
            method: 'post',
            success: function(data){
            	$(this).children('#reworknum').html(data.name.rework)
            },
            context: this
           });
		});
	
}})