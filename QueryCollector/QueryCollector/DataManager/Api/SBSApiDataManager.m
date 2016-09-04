//
//  SBSApiDataManager.m
//  QueryCollector
//
//  Created by Sandra on 19/7/16.
//  Copyright © 2016 SBS. All rights reserved.
//

#import "SBSApiDataManager.h"

@implementation SBSApiDataManager


#pragma mark - Manager URL/Connection
/**
 *  Aplica un wrap sobre un fragmento y aplica protocolo y raiz de la url en base a la configuración
 *  @param fragments Fragmento de url que se utilizará para formatear
 *  @return Url absoluta
 */
-(NSURL*)wrapUrl:(NSString*)fragments toRoute: (NSString*) route {
    NSURL *url = [NSURL URLWithString:[self formatUrl:[self getApiUrl: route] withProtocol:[self getProtocol] withFragments:fragments]];
    
    return url;
}

/**
 *  Obtiene la url raiz en base a la configuración
 *  @return Url raiz
 */
-(NSString*)getApiUrl: (NSString*)route {
    
    //Sandra
    NSString * theRoute = [NSString stringWithFormat:@"127.0.0.1:3000/%@",route];
    //NSString * theRoute = [NSString stringWithFormat:@"192.168.100.70:3000/%@",route];
    return theRoute;
}

/**
 *  Obtiene el protocolo en base a la configuración
 *  @return Protocolo (http, https)
 */
-(NSString*)getProtocol {
    return @"http";
}
/**
 *  Formatea una url separada en fragmentos
 *  @param url       Url absoluta raiz
 *  @param protocol  Protocolo de la petición (http, https)
 *  @param fragments Fragmento posterior a añadir a la url raiz
 *  @return Url formateada
 */
-(NSString*)formatUrl:(NSString*)url withProtocol:(NSString*)protocol withFragments:(NSString*)fragments {
    return [NSString stringWithFormat:@"%@://%@/%@", protocol, url, fragments];
}


-(NSMutableURLRequest*) buildUrlRequest:(NSString*)route contentJSON:(NSMutableArray*)json{
    
    NSURL *url = [self wrapUrl:@"" toRoute:route];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    if(json != nil){
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:json options:0 error:nil];
        [request setHTTPBody:postData];
    }
    
    return request;
    
}


-(NSDictionary*)callRequest:(NSString*)route andContentArray:(NSMutableArray*)contentArray {
    NSLog(@"Entro en callRequest para llamar a ruta : %@", route);
    
    NSHTTPURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:[self buildUrlRequest:route contentJSON:contentArray] returningResponse:&response error:&error];
    if([response statusCode] != 200) {
        return nil;
    }
    
    NSDictionary* jsonResponse = [ NSJSONSerialization JSONObjectWithData: data
                                                                  options: kNilOptions
                                                                    error: &error ];
    return jsonResponse;
}

#pragma mark - Answer

//Send an array with answer/s to Server
-(BOOL)sendAnwers:(NSMutableArray*)answerArray {
    /*NSDictionary *jsonToSend = [self callRequest:@"setAnswer" andContentArray:answerArray];
    BOOL success;
    if (jsonToSend != nil && [[jsonToSend objectForKey:@"success"] boolValue] == true) {
        NSLog(@"Respuestas guardadas guay en el Server");
        success = true;
    } else if (jsonToSend == nil || [[jsonToSend objectForKey:@"success"] boolValue] == false) {
        NSLog(@"Las respuestas NO se han guardado!");
        success = false;
    }*/
    return true; //success;
}

#pragma mark - Cities
-(NSArray*) getCitiesFromServer {
    
    NSMutableArray *citiesList = nil;
    SBSCityModel *city;
    
    NSDictionary* jsonResponse = [self callRequest:@"getCities" andContentArray:nil];
    
    if(jsonResponse != nil && [[jsonResponse objectForKey:@"success"] boolValue] == true) {
        NSLog(@"Sí ha habido conexión de datos");
        
        NSData *objectData = [ [jsonResponse objectForKey:@"citiesList"] dataUsingEncoding:NSUTF8StringEncoding];
        NSError * error=nil;
        NSDictionary * parsedData = [NSJSONSerialization JSONObjectWithData:objectData options:kNilOptions error:&error];
        
        NSLog(@"%@",parsedData);
        city = [[SBSCityModel alloc]init];
        citiesList = [[NSMutableArray alloc]init];
        citiesList = [city hydrateCitiesArrayWith:parsedData];
        
    } else {
        NSLog(@"Oh noooo, algo ha fallado con las cities");
    }
    
    return [citiesList copy];;
}


@end
