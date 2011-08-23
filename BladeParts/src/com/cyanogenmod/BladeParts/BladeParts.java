package com.cyanogenmod.BladeParts;

import com.cyanogenmod.BladeParts.R;

import android.os.Bundle;
import android.preference.PreferenceActivity;

public class BladeParts extends PreferenceActivity {

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		addPreferencesFromResource(R.xml.bladeparts);
	}
}
