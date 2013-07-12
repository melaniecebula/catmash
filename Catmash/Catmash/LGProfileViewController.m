//
//  LGProfileViewController.m
//  Catmash
//
//  Created by Hannia Zia on 7/11/13.
//  Copyright (c) 2013 TheLGs. All rights reserved.
//

#import "LGProfileViewController.h"
#import "LGCat.h"
#import "LGCatStore.h"

@interface LGProfileViewController ()
@property (weak, nonatomic) IBOutlet UITextField *catName;
@property (weak, nonatomic) IBOutlet UIImageView *catImage;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (nonatomic, strong) LGCat *cat;

- (IBAction)takePicture:(id)sender;
- (IBAction)nameFieldDidEnd:(id)sender;
- (IBAction)doneButton:(id)sender;

@end

@implementation LGProfileViewController
@synthesize cat;


- (id)init
{
    return [self initWithNibName:nil bundle:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)takePicture:(id)sender {
    
   
   
    UIImagePickerController *imagePicker =
    [[UIImagePickerController alloc] init];
    
    // If our device has a camera, we want to take a picture, otherwise, we
    // just pick from photo library
    if ([UIImagePickerController
         isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    } else {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    
    // Place image picker on the screen
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)nameFieldDidEnd:(id)sender {
    [sender resignFirstResponder];
    
}

- (IBAction)doneButton:(id)sender {
    LGCat *newCat = [[LGCat alloc] init];
    
    NSString *name = _catName.text;
    UIImage *image = _catImage.image;
    
    if (name==nil || [name isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Please add a name" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if (image == nil)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Please add an image" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
    
    [newCat setCatName:name];
    [newCat setCatImage:image];
    
    [[LGCatStore sharedStore] addToCatStore:newCat];
    
    [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Get picked image from info dictionary
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    
    
    // Put that image onto the screen in our image view
    [_catImage setImage:image];
    
    // Take image picker off the screen -
    // you must call this dismiss method
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
