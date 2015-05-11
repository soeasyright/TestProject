//
//  MathViewController.m
//  dynamicLayout
//
//  Created by Viscovery on 2015/5/8.
//  Copyright (c) 2015年 watsons. All rights reserved.
//

#import "MathViewController.h"
#import <Accelerate/Accelerate.h>
@interface MathViewController ()

@end

@implementation MathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    float matrix[3][2] = {
        {5.0f, 1.0f},
        {1.0f, 5.0f},
        {5.0f, 1.0f}
    };
    
    float vector[2] = {1.0f, 2.0f};
    
    float ans[3] = {0.f, 0.f, 0.f};
    
    cblas_sgemv(CblasRowMajor, CblasNoTrans, 3, 2, 1.0f, (float*)matrix, 2, (float*)vector, 1, 1.0f, ans, 1);
    
    NSLog(@"ans = [%f, %f, %f]", ans[0], ans[1], ans[2]);
    
    
    //解聯立
    //2x + 5y = 24
    //3x + 4y = 36
    int colA = 2, rowA = 2;
    double *A = (double*)malloc(colA*rowA*sizeof(double));
    A[0] = 2; A[2] = 5;
    A[1] = 3; A[3] = 4;
    
    int colB = 1, rowB = 2;
    double *B = (double*)malloc(colB*rowB*sizeof(double));
    B[0] = 24; B[1] = 36;
    
    // N = number of columns of A.
    // NRHS = number of columns of B.
    // LDA = number of rows of A.
    // IPIV = pivot indices.
    // LDB = number of rows of B.
    int N = colA,
    NRHS = colB,
    LDA = rowA,
    IPIV[2],
    LDB = rowB,
    INFO;
    
    dgesv_(&N, &NRHS, A, &LDA, IPIV, B, &LDB, &INFO);
    NSLog(@"X = %f, Y = %f", B[0], B[1]);


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
