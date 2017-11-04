.class public Lcom/dryseed/testandfix/MainActivity_CF;
.super Landroid/support/v7/app/AppCompatActivity;
.source "MainActivity.java"


# instance fields
.field private final FILE_EXTENSION:Ljava/lang/String;

.field private mPatchDir:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 15
    const-string v0, ".apatch"

    iput-object v0, p0, Lcom/dryseed/testandfix/MainActivity_CF;->FILE_EXTENSION:Ljava/lang/String;

    return-void
.end method

.method private getPatchName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/dryseed/testandfix/MainActivity_CF;->mPatchDir:Ljava/lang/String;

    const-string v1, "ds"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ".apatch"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public createBug(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .annotation runtime Lcom/alipay/euler/andfix/annotation/MethodReplace;
        clazz = "com.dryseed.testandfix.MainActivity"
        method = "createBug"
    .end annotation

    .prologue
    .line 35
    const-string v0, "bug has fix"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 36
    return-void
.end method

.method public fixBug(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 39
    invoke-static {}, Lcom/dryseed/testandfix/andfix/AndFixPatchManager;->getInstance()Lcom/dryseed/testandfix/andfix/AndFixPatchManager;

    move-result-object v0

    invoke-direct {p0}, Lcom/dryseed/testandfix/MainActivity_CF;->getPatchName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/dryseed/testandfix/andfix/AndFixPatchManager;->addPatch(Ljava/lang/String;)V

    .line 40
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 20
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 21
    const v1, 0x7f04001b

    invoke-virtual {p0, v1}, Lcom/dryseed/testandfix/MainActivity_CF;->setContentView(I)V

    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/dryseed/testandfix/MainActivity_CF;->getExternalCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/apatch/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/dryseed/testandfix/MainActivity_CF;->mPatchDir:Ljava/lang/String;

    .line 24
    const-string v1, "MMM"

    iget-object v2, p0, Lcom/dryseed/testandfix/MainActivity_CF;->mPatchDir:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/dryseed/testandfix/MainActivity_CF;->mPatchDir:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 26
    .local v0, "file":Ljava/io/File;
    if-nez v0, :cond_1

    .line 32
    :cond_0
    :goto_0
    return-void

    .line 29
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 30
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    goto :goto_0
.end method
