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
    .line 15
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 17
    const-string v0, ".apatch"

    iput-object v0, p0, Lcom/dryseed/testandfix/MainActivity_CF;->FILE_EXTENSION:Ljava/lang/String;

    return-void
.end method

.method private startAndFixService()V
    .locals 2

    .prologue
    .line 39
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/dryseed/testandfix/andfix/AndFixService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 40
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/dryseed/testandfix/MainActivity_CF;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 41
    return-void
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
    .line 44
    const-string v0, "bug has fix"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 45
    return-void
.end method

.method public fixBug(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 49
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 22
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 23
    const v0, 0x7f04001b

    invoke-virtual {p0, v0}, Lcom/dryseed/testandfix/MainActivity_CF;->setContentView(I)V

    .line 35
    invoke-direct {p0}, Lcom/dryseed/testandfix/MainActivity_CF;->startAndFixService()V

    .line 36
    return-void
.end method
