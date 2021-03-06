package com.dryseed.testandfix;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.dryseed.testandfix.andfix.AndFixPatchManager;
import com.dryseed.testandfix.andfix.AndFixService;

import java.io.File;

public class MainActivity extends AppCompatActivity {

    private final String FILE_EXTENSION = ".apatch";
    private String mPatchDir;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mPatchDir = getExternalCacheDir().getAbsolutePath() + "/apatch/";
        Log.d("MMM", mPatchDir); // /storage/emulated/0/Android/data/com.dryseed.testandfix/cache/apatch/
        File file = new File(mPatchDir);
        if (file == null) {
            return;
        }
        if (!file.exists()) {
            file.mkdir();
        }

        //startAndFixService();
    }

    private void startAndFixService() {
        Intent intent = new Intent(this, AndFixService.class);
        startService(intent);
    }

    public void createBug(View view) {
        Toast.makeText(this, "create bug", Toast.LENGTH_SHORT).show();
    }

    public void fixBug(View view) {
        AndFixPatchManager.getInstance().addPatch(getPatchName());
    }

    private String getPatchName() {
        return mPatchDir.concat("ds").concat(FILE_EXTENSION);
    }
}
