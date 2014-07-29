molgenis.dataexplorer.createHeader = function(entityMetaData) {
	$('#entity-class-name').html(entityMetaData.label);

	if (entityMetaData.description) {
		var description = $('<span data-placement="bottom"></span>');
		description.html(entityMetaData.description);
		description.attr('data-title', entityMetaData.description);
		$('#entity-class-description').html(description.tooltip());
	} else {
		$('#entity-class-description').html('');
	}
};
