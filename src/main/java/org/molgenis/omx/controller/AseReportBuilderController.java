package org.molgenis.omx.controller;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.molgenis.data.CrudRepository;
import org.molgenis.data.DataService;
import org.molgenis.data.Entity;
import org.molgenis.data.support.QueryImpl;
import org.molgenis.framework.ui.MolgenisPluginController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import au.com.bytecode.opencsv.CSVWriter;

@Controller
public class AseReportBuilderController extends MolgenisPluginController
{
	private static final String URI = "/plugin/dataexplorer/details/csv";

	public AseReportBuilderController()
	{
		super(URI);
	}

	@Autowired
	private DataService dataService;

	@RequestMapping(value = URI, method = RequestMethod.GET)
	public void buildCustomCsvDownload(@RequestParam(value = "entityId") String snpId, HttpServletResponse response)
			throws IOException
	{
		response.setContentType("text/csv");
		response.addHeader("Content-Disposition", "attachment; filename=sample_table_" + snpId + ".csv");

		CrudRepository sampleAseRepository = dataService.getCrudRepository("SampleAse");
		Iterable<Entity> sampleAses = sampleAseRepository.findAll(new QueryImpl().eq("SNP_ID", snpId));

		CSVWriter csvWriter = new CSVWriter(new OutputStreamWriter(response.getOutputStream(), "UTF-8"), '\t',
				CSVWriter.NO_QUOTE_CHARACTER, CSVWriter.NO_ESCAPE_CHARACTER);
		csvWriter.writeNext(new String[]
		{ "Sample_ID", "Ref_Counts", "Alt_Counts", "Tissue", "Cancer", "Secondary_Study_ID", "Gender", "Population" });
		for (Entity sampleAse : sampleAses)
		{
			csvWriter.writeNext(getRowForEntity(sampleAse));
		}
		csvWriter.close();
	}

	private String[] getRowForEntity(Entity sampleAse)
	{
		List<String> rowValues = new ArrayList<String>();
		for (String attributeName : Arrays.asList("SampleIds", "Ref_Counts", "Alt_Counts"))
		{
			addValueToRow(rowValues, sampleAse.get(attributeName));
		}
		Entity sample = (Entity) sampleAse.getEntity("SampleIds");
		addValueToRow(rowValues, sample.get("tissue"));
		addValueToRow(rowValues, sample.get("cancer"));
		addValueToRow(rowValues, sample.get("secondary_study_accession"));
		addValueToRow(rowValues, sample.get("gender"));
		addValueToRow(rowValues, sample.get("population"));
		return rowValues.toArray(new String[0]);
	}

	private void addValueToRow(List<String> rowValues, Object value)
	{
		if (value != null)
		{
			rowValues.add(value.toString());
		}
		else
		{
			rowValues.add("");
		}
	}
}
